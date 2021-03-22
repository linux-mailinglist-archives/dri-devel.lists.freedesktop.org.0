Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FB83452D7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 00:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1CF6E041;
	Mon, 22 Mar 2021 23:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188176E041;
 Mon, 22 Mar 2021 23:13:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j7so18892148wrd.1;
 Mon, 22 Mar 2021 16:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tYvb3I5DkX3N6jN+5U7mg9SkFokyTC7DYO1POXsmyXA=;
 b=JAukgRqBFlBqYxoTg07QIe3L0u4Zd4pnU8/KawSiQ9CobCuM3gzIOiljfx6LuzgDWA
 UowTprAJ6pvQSXvs4KSQRoxyhk97bRV/HvA6p2Z7/U2jyU55VRoMchp/WW94qOWwfctx
 xjztqDCBK6KyOMwxPOwi4e26tFik5N8gD8ME46WI4P9N9+IGYjmYXftjUoCOmT9YRUhI
 oxS7NQe6LKxh0Fe3YkrHljuKHXVZGAd59GORjepGb1sCy/oTzRkzKEYxW8PIJ/sFr1d6
 zI5HyhOjX7JC0HU1eEG4mNxiJ04gBc9w35eUnfsZO8LW67/ihxMVwREYJPst2Xb0XGu3
 JGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=tYvb3I5DkX3N6jN+5U7mg9SkFokyTC7DYO1POXsmyXA=;
 b=OU6TZF9wGheM9uKqNOEjofi9WOvrxDNd8jCWfpV1TTBJuDpHAOiWoz/suHoA4fIaKx
 l5sQJ/Z5rGcJyvBehQGg8V91XfIzFqfyeZxmeh10cxtNGjwTtRyW28EoutjASpV4+kN6
 n2uNK1byTAlooAdxvmwFs7LnyrnqzqrsndQitTEyBLuZ/ZZ2OVpTYx/Y6iUkZoOitz60
 +2SKQ1YGLViXdFWAknuIAvxQksoqvTvTfYEnuV7kNbQI+j7lckFdJXdYZ2yPdEfq1zBS
 40d+YhaEezheoaKVfr4gzevjmkkgyWlhXMxdqAKZ4NaEERk8u/8cUbZpUmgaRsOjcqB4
 uSKw==
X-Gm-Message-State: AOAM530jVA8veKt6fLGuMUCFhwEPyFMEyK4yJfb7Fd8C6eKpFSnWazBv
 DhiNNkeW9MjPTnHDIKnKCKo=
X-Google-Smtp-Source: ABdhPJwD5sKWkDZI+WUiEv9LaU8t0tl7e3Sco91hCCQ6VjFxt+KbUyFjpi5+6SIPcvWKZoMwC1DUgg==
X-Received: by 2002:adf:b642:: with SMTP id i2mr867183wre.8.1616454815721;
 Mon, 22 Mar 2021 16:13:35 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id w6sm20916828wrl.49.2021.03.22.16.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 16:13:35 -0700 (PDT)
Date: Tue, 23 Mar 2021 00:13:32 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Martin Sebor <msebor@gmail.com>
Subject: Re: [PATCH 02/11] x86: tboot: avoid Wstringop-overread-warning
Message-ID: <20210322231332.GA1984184@gmail.com>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-3-arnd@kernel.org>
 <20210322202958.GA1955909@gmail.com>
 <b944a853-0e4b-b767-0175-cc2c1edba759@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b944a853-0e4b-b767-0175-cc2c1edba759@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, linux-scsi@vger.kernel.org, x86@kernel.org,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Ingo Molnar <mingo@redhat.com>, Kalle Valo <kvalo@codeaurora.org>,
 intel-gfx@lists.freedesktop.org, Serge Hallyn <serge@hallyn.com>,
 Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Ning Sun <ning.sun@intel.com>, Anders Larsen <al@alarsen.net>,
 Borislav Petkov <bp@alien8.de>, cgroups@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@kernel.org>, Martin Sebor <msebor@gcc.gnu.org>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 linux-security-module@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


* Martin Sebor <msebor@gmail.com> wrote:

> > I.e. the real workaround might be to turn off the -Wstringop-overread-warning,
> > until GCC-11 gets fixed?
> 
> In GCC 10 -Wstringop-overread is a subset of -Wstringop-overflow.
> GCC 11 breaks it out as a separate warning to make it easier to
> control.  Both warnings have caught some real bugs but they both
> have a nonzero rate of false positives.  Other than bug reports
> we don't have enough data to say what their S/N ratio might be
> but my sense is that it's fairly high in general.
> 
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=wstringop-overread
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=wstringop-overflow
> 
> In GCC 11, all access warnings expect objects to be either declared
> or allocated.  Pointers with constant values are taken to point to
> nothing valid (as Arnd mentioned above, this is to detect invalid
> accesses to members of structs at address zero).
> 
> One possible solution to the known address problem is to extend GCC
> attributes address and io that pin an object to a hardwired address
> to all targets (at the moment they're supported on just one or two
> targets).  I'm not sure this can still happen before GCC 11 releases
> sometime in April or May.
> 
> Until then, another workaround is to convert the fixed address to
> a volatile pointer before using it for the access, along the lines
> below.  It should have only a negligible effect on efficiency.

Thank you for the detailed answer!

I think I'll go with Arnd's original patch - which makes the code a 
slightly bit cleaner by separating out the check_tboot_version() check 
into a standalone function.

The only ugly aspect is the global nature of the 'tboot' pointer - but 
that's a self-inflicted wound.

I'd also guess that the S/N ratio somewhat unfairly penalizes this 
warning right now, because the kernel had a decade of growing real 
fixes via other efforts such as static and dynamic instrumentation as 
well.

So the probability of false positive remaining is in fact higher, and 
going forward we should see a better S/N ratio of this warning. Most 
of which will never be seen by upstream maintainers, as the mishaps 
will stay at the individual developer level. :-)

Thanks,

	Ingo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
