Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941CAC9616D
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590E610E2D9;
	Mon,  1 Dec 2025 08:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=runbox.com header.i=@runbox.com header.b="mFrPq+wX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4792 seconds by postgrey-1.36 at gabe;
 Mon, 01 Dec 2025 00:29:52 UTC
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com
 [185.226.149.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2957F10E073
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 00:29:52 +0000 (UTC)
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
 by mailtransmit05.runbox.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david.laight@runbox.com>)
 id 1vPqXs-005ult-J7; Mon, 01 Dec 2025 00:09:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com; 
 s=selector2;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
 bh=v/S2j3lvoVofj+NHzuY+rgCTCXBDYm4Z6flk9aF4pmQ=; b=mFrPq+wXEaIoygFF9DHa4zLG3L
 TyqZ63LxHSpAHU/YMdp+Q6uRww/6Rro4MG75ng3EP2g/2YovW2KntIhIfi6G+JO/52OnzRNGqa7R4
 2SGYb/AId7BQUF6qt3rY/Z1R4rEYxdA/lfkROXhLh0cAAXh1gv8NdJYHRa/M1dKg9knqdqylfsUKK
 1UiT4/cfp+81OXx7n/5+RZXW+sbnCLVNIuakvoXf+/9BBeh7qp7A+idVLbLeGdK0mYrA1i8qoSSWK
 kb0nyGd7g06G/zQIELdQiSRl88kvzkKM4fsfuBjNIjJbLBEtvZG6+QFQBwDi8vdLE3pNIG0mqEoYw
 KEGKE1OA==;
Received: from [10.9.9.72] (helo=submission01.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <david.laight@runbox.com>)
 id 1vPqXq-0007xb-5s; Mon, 01 Dec 2025 00:09:30 +0100
Received: by submission01.runbox with esmtpsa [Authenticated ID (1493616)]
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256) (Exim 4.93)
 id 1vPqXo-0065vo-KU; Mon, 01 Dec 2025 00:09:28 +0100
Date: Sun, 30 Nov 2025 23:09:25 +0000
From: david laight <david.laight@runbox.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Yury Norov <yury.norov@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Randy Dunlap <rdunlap@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Petr Pavlu
 <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] tracing: move tracing declarations from kernel.h to
 a dedicated header
Message-ID: <20251130230925.376b5377@pumpkin>
In-Reply-To: <aSyertuRRX9Czvyz@smile.fi.intel.com>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-4-yury.norov@gmail.com>
 <aStX3242e3mo5H05@smile.fi.intel.com> <aSyJ83v7EEAPHXeU@yury>
 <aSyertuRRX9Czvyz@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 01 Dec 2025 08:19:25 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 30 Nov 2025 21:44:46 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Sun, Nov 30, 2025 at 01:16:19PM -0500, Yury Norov wrote:
> > On Sat, Nov 29, 2025 at 10:30:23PM +0200, Andy Shevchenko wrote:  
> > > On Sat, Nov 29, 2025 at 02:53:02PM -0500, Yury Norov (NVIDIA) wrote:  
> > > > Tracing is a half of the kernel.h in terms of LOCs, although it's a
> > > > self-consistent part. Move it to a separate header.
> > > > 
> > > > This is a pure move, except for removing a few 'extern's.  
> > > 
> > > Yeah, I also have something similar (but half-baked) locally, the Q I wanted to
> > > ask is why a separate header? We have already some of tracing headers. Doesn't
> > > suit well?  
> > 
> > Just as said in the commit message - this part is more or less
> > self-consistent and debugging-oriented. If someone needs to just
> > throw trace_printk() in their driver, they will not have to pull
> > all the heavy tracing machinery.  
> 
> Please, add a summary of this to it. It will be much clearer and based on it
> I agree with your judgement.

It is worth checking whether the files get included anyway, and whether it
really makes that much difference.

Fiddling with kernel.h and extracting small 'leaf' headers from it is also
unlikely to make a big difference.

Try adding a syntax error to (say) sys/ioctl.h and see where it is included
from the first time - I suspect you'll be surprised.
Working on that include list might be more fruitful (in reducing build times).

	David
