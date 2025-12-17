Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0381CC5A3F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 01:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FAF10E9B2;
	Wed, 17 Dec 2025 00:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jByzWLcu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com
 [74.125.224.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7811210E9B2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 00:52:12 +0000 (UTC)
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-64475c16a11so6058801d50.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 16:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765932731; x=1766537531; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cioc2n+rnrE7Hz/WlxOPFl1U+rBoRANXF/y2Cvvc8mg=;
 b=jByzWLcu2ypryZWKHB57N5Ux+fN1ueHxmoLQp5bPUl9jwgiauU7Aj5nHu1hwgek4/U
 257KRlm2lNXF/YsR603OFjPToTtLeXvCesxEItF8sjN9Ucv2CrAnedYcHJJvWsSCBHGM
 sKqIdIx/94fT5r7ib3IUyD+N/uU5NAA+tQFWZy4Pna/YRQe9PUx4p/yJRsRq1Fo5KwSw
 aiJf+9qJwYw4U+URzK/5QGfKVy9XHQsNZ5bb8ECS9Bnn7GF8DXGhdCCmEuvOheM0GohX
 V51TLs2s4U1Bdc1lC5ayMh16UNmp0WkgGLBknTI9ZYk2HfFV9qItzxJK1jO+ed2isyMS
 x6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765932731; x=1766537531;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cioc2n+rnrE7Hz/WlxOPFl1U+rBoRANXF/y2Cvvc8mg=;
 b=qX/KN6C6OigiySp++M1PDsFVaJi8KyXYYiHL6ISs21jvbJDrJJXKXkQsUsiIe1KF6p
 EUOqRjLaM4KaP62fcfCXl5gh6+48NtGJ5/4o5nAkWxHv36kKow8I7SgTCAvThV+7dXaV
 ZZz2kJD3yrGn5v3lOeh4wirD2EU2d1+lM5lKe7BE7AyB0OIlwyGT5zHLcrXXaCVB9K0H
 /9IyZpOS02vxmRWb7eS1/q5N38yAUkQWsKpu1kMQ1G769SmayxwGhlcdV3QlYgoDE+kd
 Dvj/kHZNPj/+Sc8rBSa0ECiQGuZEKUdOJrQ5kXrjbM8bd6HOlOTf4lpErXZiyuj3WOKc
 GyhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXakGNwTCVMzHbKr375JAzpT1pz/s7E6psNHuTvCfLPW3GuebllV9rntvOAkSJg2wIp6m8CHBIQ28M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywq+GUzJ5Sd0ZgQF2QxM8V83tyTfPgdCO2Mm80hxOC1K7jYL3zb
 qZUG1FjFhTXCrPgEANj+1RYLIvx8wcmor7P964UyRT6LWzEDb88r6Rxk
X-Gm-Gg: AY/fxX5DvwSXTV+4G370qG4YEbx46A+9ciGY6uZmlr5WUA6zMqV/chDJH85Dm7dAt8x
 ZD2iW4VE3sT6b4+ZtqD3CqZ2cCmOFzSTVN/1yrZIms7ZylzJsekus8zsX/i3nAVkbAimIbgn812
 WFNoCLnRje7pwxk1s7v7+VO9ekSvYb523asEJtanEeWo8Idk9XJzccP0ls5o8Z/WtLr5dQpZyZn
 wOnwWp/DG84JcbkY24JZpveGILmm3wQSOfGMuxtNOhj5SU03b5eLNwb96Ipo5N1HbpBvBeYfpfp
 LxwvyFrcD50O1R3RULURmBmN5uanbpdQ7ewgUfj2ldupWTgnqUOxGIsOGVSgXjrHUTBqst/v/ed
 oC2fLeRvHzhH/valhtw8H0IJFdEiq32xq6Te8izBqppRVVjyueeT1lNKj+vpctvH+KeUWkF6I7j
 2vp95XKlvE64mEYjbUAw==
X-Google-Smtp-Source: AGHT+IHPSAalZDhQ4W90Khd8oGoAiFaQ0V3Y94CkXQWH65kUCL7t9GyQ23cHStEcEkn+KhSMT+Nvqg==
X-Received: by 2002:a53:d14b:0:b0:63f:a488:ba46 with SMTP id
 956f58d0204a3-645555eb6ccmr9904880d50.32.1765932731223; 
 Tue, 16 Dec 2025 16:52:11 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:7f3c:658f:3c84:2aa3])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-64477d583e1sm8364623d50.7.2025.12.16.16.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 16:52:10 -0800 (PST)
Date: Tue, 16 Dec 2025 19:52:10 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] tracing: move tracing declarations from kernel.h
 to a dedicated header
Message-ID: <aUH-ur4n291DBj4M@yury>
References: <20251205175237.242022-1-yury.norov@gmail.com>
 <20251205175237.242022-5-yury.norov@gmail.com>
 <20251216161316.45b3f19ff0ad482018137189@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216161316.45b3f19ff0ad482018137189@linux-foundation.org>
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

On Tue, Dec 16, 2025 at 04:13:16PM -0800, Andrew Morton wrote:
> On Fri,  5 Dec 2025 12:52:35 -0500 "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
> 
> > Tracing is a half of the kernel.h in terms of LOCs, although it's
> > a self-consistent part. It is intended for quick debugging purposes
> > and isn't used by the normal tracing utilities.
> > 
> > Move it to a separate header. If someone needs to just throw a
> > trace_printk() in their driver, they will not have to pull all
> > the heavy tracing machinery.
> > 
> > This is a pure move, except for removing a few 'extern's.
> > 
> 
> This one blows up my x86_64 allmodconfig, gcc-15.2.0:

Thanks, Andrew. I'll take a look.
