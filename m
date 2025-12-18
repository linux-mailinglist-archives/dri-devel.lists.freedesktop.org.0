Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D73CCDFFE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 00:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E08C10EAAB;
	Thu, 18 Dec 2025 23:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i23vD2XR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116FE10EAAB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 23:47:35 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7e2762ad850so1331234b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 15:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766101654; x=1766706454; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QZalkBGMZvwmDVV1ya5Lu+/scueeEmPRx1djh9JCuvk=;
 b=i23vD2XR2Mos4nRCaitwP9LwJRwqvsZq6O1FnPuJ59WD11COInv4MIgu6BAOka7+qd
 YjOrK1yylRuKTuWgFAFke0Oo3dyHQSiirzrSW45/5MwK1NShiKh87cu9fejupxhb7Xhm
 ykGJpqH2L9lL1IB3iVmwI7PoLMuL8sTvnwbKx5yerDR3db4CiVRtr5m6kAeJ0ElIvr6P
 0GcSZEa9BlOTl5GG7zO2hMxqj0jhWwP/WgvRRtEtxMNReddFiy1zgx/r+0fauga4jnov
 Qvf6K3VOKKIMl21bJs017l5I4FEN8fAjsTBGS+e9G8nmJ+yVAPne19kwj6nQDfpxB9Tx
 XxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766101654; x=1766706454;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QZalkBGMZvwmDVV1ya5Lu+/scueeEmPRx1djh9JCuvk=;
 b=oozSmN8jC4Z9avW8WwqdJLvZrankfL21/pRuAd3mvIDqQpTzMSPqtUIlA9KyM0M+yP
 LIVP7m3inj7y8fMJIkakA0MHR4d3Qkrv7L5NGGIkgOoPlvWfzfL9jTvtFLU/VAgUxfPr
 5S2hUMjFdGvdKpILYgUqsbt2edLgIWBr52A5301j9WLSKTfJonWjjRvcsZift509+WB+
 ktkF8EztzUq/uG2HdNTKI1pbDlWO2BtYt7HQIEVzS8R1sHxoyxJ36lZq7iRA15rGCUlT
 vwDapVstt51D+BaS3H322HEtjNak4VPT5giWUpEHoAQqfPUvf+hDNwSdmrY6/fbSBn9v
 AOaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW12reb/myXk1d/FcsH2AFbB6Z23OjpHyBf8FPQlcGmKPkUxIKCPTosSw+7CVNwzXq0q3sLFw7e/Bs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK40JmNhM3MBPCHzaiIVjp7CJy3eTSpDIY16crIEWQlrAvWqUO
 69DDkh9VTZctSi/MsJ6k9FmnyiKJof6UIsw+XeaTuG37J5vQceuGLrGMoeEyKg==
X-Gm-Gg: AY/fxX6JM0uleFrlTm1u3DQ9jvwCxz7SRe1B6ByDousThkF7s6Tb7WtjlkSHy7TCj0f
 mdmHxoZwv3FjJMs7HgqFfZm7zhHFMGWhdw5pRTQG8mQAvwBkOPDdhJG2yzPuxZW/16qKDtPzimt
 aVBO7tN+qQwU5n83UugUHtX9adhQ9Bpo71h803NtnPI5fYVRRvou9lpw5D73t4vecgq9rmcepMc
 ZCC7Wg30W6dSEuIzMIwBkLZkoQEE9XVp9EigGpXGTwnBexumEf6U/E5hFpXxzuWeUOStx+zZEyf
 ShGZmOOWGQ6ugi8eroafemdcAU/grg2o4ftOCawAlcFmIGDml8+b977iFcJbEgoJgXaZ6t4UuGN
 2JVnDYKICPiiBuiRg7i6Ig8QxepQdeM/xiDv2AGeBIpjSuAKRlo0aXuR2sBrrhUhcJmhrs9KYHz
 w1PSoR7w==
X-Google-Smtp-Source: AGHT+IF21Ecc6Jc0533/8GWL1yiDmEnXNfeJkD3kNuw+xcQOMYUm7A56eghLjVuqVAs0d9Em+kHEaQ==
X-Received: by 2002:a05:690c:7012:b0:78d:6d62:f93f with SMTP id
 00721157ae682-78fb3ed3062mr7661257b3.8.1766094799618; 
 Thu, 18 Dec 2025 13:53:19 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:c44b:debe:992d:e6a])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78fb44f01e5sm2294447b3.35.2025.12.18.13.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 13:53:19 -0800 (PST)
Date: Thu, 18 Dec 2025 16:53:18 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 4/4] tracing: move tracing declarations from kernel.h
 to a dedicated header
Message-ID: <aUR3zqq4-qMV_bFh@yury>
References: <20251205175237.242022-1-yury.norov@gmail.com>
 <20251205175237.242022-5-yury.norov@gmail.com>
 <20251216161316.45b3f19ff0ad482018137189@linux-foundation.org>
 <55ceb7bf-0fe9-4edc-81c2-d51366847eec@infradead.org>
 <aUN8Hm377C5A0ILX@yury>
 <20251218123349.35339242@gandalf.local.home>
 <20251218124326.22334325@gandalf.local.home>
 <aURlK1gpCrfLEKN9@yury>
 <20251218162542.476009db@gandalf.local.home>
 <20251218164103.3c535de3@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218164103.3c535de3@gandalf.local.home>
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

On Thu, Dec 18, 2025 at 04:41:03PM -0500, Steven Rostedt wrote:
> On Thu, 18 Dec 2025 16:25:42 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > On Thu, 18 Dec 2025 15:33:47 -0500
> > Yury Norov <yury.norov@gmail.com> wrote:
> > 
> > > > I don't actually remember why I had __trace_puts() pass in the size. I
> > > > could change it to:    
> > > 
> > > This is the best approach. I'll schedule it for v4. Would you like me to
> > > take it as-is, or you'd send a patch?
> > >    
> > 
> > Let me send an official patch.
> > 
> 
> You can find it here (I Cc'd you too). Feel free to add it to your patch set.
> 
>   https://lore.kernel.org/all/20251218163739.5605f9ea@gandalf.local.home/

Thanks, will do.
