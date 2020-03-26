Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FD0193BAD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 10:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9BC6E89D;
	Thu, 26 Mar 2020 09:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04EF06E89D;
 Thu, 26 Mar 2020 09:22:18 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 26so6908269wmk.1;
 Thu, 26 Mar 2020 02:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FlDn5DLuAGFwOKbYCG6SBICMqVpoIS+lwTO53ZZDDjM=;
 b=dnfFO30O8b3RHtisdF7O/LiOdkh/dGOet8uunkTrexLbVqPR+mk8mHCwRsw6tk7KLv
 auq6wGbDAz0TCaH7hgT3AOV6cKXX7hHNpWE2HuusvvM73PietjLjxDKuuZOqmmQ//Ul1
 jYXRonD3rZ/o40owKe3SUybXM+MEcOCrLrATCzJzVb4iH9/w+oTVltDAY8WDD19GP6PY
 kt8GSCVtHsjJMZn/k+DnyW9lAo7OQxFDDTquFzauPzkbafYzNtb5rBgX6k+HHYeA7Wcz
 y/Okk0gWNzvBzqlIHdWGI8cXCcwSCT7YlgNWhkUmWaXaLmi4gTEtwgXiUp4cqAD5niQM
 w4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=FlDn5DLuAGFwOKbYCG6SBICMqVpoIS+lwTO53ZZDDjM=;
 b=bv9anh/PLxeAN+/Dvda6feg14SufaF1ZtHrt1yFiKkLoH38jv5jX+I328nfqOi5vQ8
 zX9GOGKPV/nh6wQvu6oldtgYYNWKOsxD+Mdfz7zIAHoH+IN4/i7kOb3/RWfC1WSbeO8T
 6l2csjughxtwr6XGISHmClFDdqW9Q5w39Gv8BYz08dPnkOAksmBXR7FndxOFOZbIST3d
 HvsvIhyG++WOLwl+jghGXJUV1Lw0Sa4Pr4qN7337ZkbskGOQfy3mPCf/EtzdUf91lTbr
 eHvkvNMLyQiavNcGhKu/aZpwVMu5RlsqcftbJBpD9dWE8uc3M+bqHIDx9BnRXTnDjNPA
 4tIw==
X-Gm-Message-State: ANhLgQ2VlWc8YlcbGuiEKX4H2tmFjB/SKj1nGfHoKaFOGt7KeiYz2XdT
 UK55zMA4dSqeJFT28OtisdY=
X-Google-Smtp-Source: ADFU+vt9VB3BsFSpXR1BzUyvHfDJQ1tQSyYFNyjRyc3JUCaQ6kAKCPhCNBUEuy6J5/CKiAsmakOtXw==
X-Received: by 2002:a05:600c:20a:: with SMTP id
 10mr2201122wmi.135.1585214536655; 
 Thu, 26 Mar 2020 02:22:16 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id l8sm2728757wmj.2.2020.03.26.02.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 02:22:16 -0700 (PDT)
Date: Thu, 26 Mar 2020 10:22:13 +0100
From: Ingo Molnar <mingo@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2 00/16] x86, crypto: remove always-defined CONFIG_AS_*
 and cosolidate Kconfig/Makefiles
Message-ID: <20200326092213.GA100918@gmail.com>
References: <20200326080104.27286-1-masahiroy@kernel.org>
 <CAHmME9pnAvgErYkcvvdakvfMY8ZGKfwHHNYzpVtJ913Tgp16CQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9pnAvgErYkcvvdakvfMY8ZGKfwHHNYzpVtJ913Tgp16CQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, "H . Peter Anvin" <hpa@zytor.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>, X86 ML <x86@kernel.org>,
 NeilBrown <neilb@suse.de>, Ingo Molnar <mingo@redhat.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Yuanhan Liu <yuanhan.liu@linux.intel.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Jim Kukunas <james.t.kukunas@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


* Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Very little has changed from last time, and this whole series still
> looks good to me. I think I already ack'd most packages, but in case
> it helps:
> 
> Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>

Acked-by: Ingo Molnar <mingo@kernel.org>

> Since this touches a lot of stuff, it might be best to get it in as 
> early as possible during the merge window, as I imagine new code being 
> added is going to want to be touching those makefiles too.

I'd argue the opposite: please merge this later in the merge window, to 
not disrupt the vast body of other stuff that has already been lined up 
and has been tested, and to give time for these new bits to get tested 
some more.

Also, please get it into -next ASAP, today would be ideal for test 
coverage ...

Thanks,

	Ingo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
