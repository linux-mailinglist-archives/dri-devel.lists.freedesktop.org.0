Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A897C4835C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 18:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA18710E43C;
	Mon, 10 Nov 2025 17:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 582 seconds by postgrey-1.36 at gabe;
 Mon, 10 Nov 2025 17:08:47 UTC
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com
 [216.40.44.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECB410E43C;
 Mon, 10 Nov 2025 17:08:47 +0000 (UTC)
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay01.hostedemail.com (Postfix) with ESMTP id 220901DE3A8;
 Mon, 10 Nov 2025 16:59:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf14.hostedemail.com (Postfix) with ESMTPA id 150E433; 
 Mon, 10 Nov 2025 16:58:56 +0000 (UTC)
Date: Mon, 10 Nov 2025 11:59:05 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "lossin@kernel.org"
 <lossin@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "mripard@kernel.org" <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "gary@garyguo.net" <gary@garyguo.net>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>, Alistair Popple
 <apopple@nvidia.com>
Subject: Re: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
Message-ID: <20251110115905.68bd2826@gandalf.local.home>
In-Reply-To: <b07b21e8-5dd4-4d40-bcad-dd8dc4fbaef4@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-9-joelagnelf@nvidia.com>
 <d6c9c7f2-098e-4b55-b754-4287b698fc1c@nvidia.com>
 <0FF9536C-8740-42C3-8EF1-5C8CD5520E49@nvidia.com>
 <93c758298250d2be9262256a698c243343b64ebc.camel@nvidia.com>
 <3c625930-348a-4c96-a63a-6a3e98e59734@nvidia.com>
 <acc56fbb56c3f40119e5a6abf9f13093d7f4c7e7.camel@nvidia.com>
 <ac85d8be-3cbd-4a51-a627-3a1a9926d801@nvidia.com>
 <b07b21e8-5dd4-4d40-bcad-dd8dc4fbaef4@nvidia.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: bo8n554brdybxe8tzkoe4zkojd6htetn
X-Spam-Status: No, score=1.37
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 150E433
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+H1piAeME0Nak4QTI1kjlWaClalfQMSFM=
X-HE-Tag: 1762793936-15452
X-HE-Meta: U2FsdGVkX18TeH8c44PwmQl/1Qx235QkyrGTE7kzUCFZNeIues/vHHR9gVsLOKSe70MgRYhlbKVtXukGhUco+yVUjRsy9xPF+C8Y6/xUVN5JPLrB93Fwkk+2uuXkJjtAhswbXwYHgrCXgdQD1BfUR5/5QQyUoDoJHnFAhiQDpwM4PX63cOWwTdQKoO+XwzmFExHfqne3daMVosLc3oQ91W7DlejwGHdcbYTjjLoD/wmQl5oDz8Sq3jfGi7KsTCxslWalMmXuHYU/O0p3AaaTW/IHAEv2no9GbmaY7vN9KIk+Ae3tCkrmiWoPoe1qBt0iabYI3JpUK9WBEmdsWBaqrBOTGQFbwqXz
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

On Mon, 10 Nov 2025 10:16:45 -0500
Joel Fernandes <joelagnelf@nvidia.com> wrote:

> > IMO, the best way to do this is the tracing subsystem. It is the lowest overhead
> > runtime kernel logging system that I know off, lockless, independent of the
> > serial console etc, next to no runtime overhead when off, etc.
> > 
> > I recommend we use the tracing subsystem for "trace" and even "spam" level
> > logging levels for Nova. The brave souls can always ask the tracing subsystem to
> > also spam to kernel logs if they so wish.
> > 
> > ++ Tracing Czar Steven Rostedt as well. Steve, Nova is a new modern Nvidia GPU
> > driver.

Not sure if there was a question here, but you can enable tracing via the
kernel command line and it will record into the ring buffer, and read it
out via /sys/kernel/tracing/trace. You could also create instances by the
kernel command line that will place events in different ring buffer
instances (/sys/kernel/tracing/instances/<instance>/trace). You could even
filter the events based on the trace event fields, process ID, CPU, etc.

There's also a tp_printk kernel command line option that will turn every
trace event into a printk() statement. You need to be careful of what
events you enable when doing this, as some events (like locking events) can
live lock the system if they are piped to printk().

After boot up, you can turn off the tp_printk with:

  echo 0 > /proc/sys/kernel/tracepoint_printk

-- Steve

> > 
> > I guess we have to decide how to do this - what kind of tracepoints do we need
> > for Nova. One use case that just came up is RPC message buffer dumps for
> > debugging communication with the firmware.
