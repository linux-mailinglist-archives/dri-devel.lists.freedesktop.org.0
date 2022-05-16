Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE1D528504
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 15:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A4710E282;
	Mon, 16 May 2022 13:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7111810FCBD;
 Mon, 16 May 2022 13:10:26 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id w123so18520654oiw.5;
 Mon, 16 May 2022 06:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=CaF92eBKzl8YhqaTS1Tzg7cnBN+wgBVFhVH+tqOT7PI=;
 b=q0OW4Ll0d1esJg4Bsi1gSdlTXNns+dyRXpjhWwy3TYP4n4qr8/NV4nZJZKjjduBKRi
 cA/1ac5Z/Sme7x9B3srXyZPtmX5SKG2ovm3cO9mWg1RmnkOoPJ3oT1jhhOpvYVxSxOtK
 EETC7rAwge3lFdAza0DWk9nk5BgdUO+u4Mgw7bEh4ZYJNK3Aeh9oPPg2Ig7eRjDoosqU
 UzYV1++XIwCfe0WO0MlnNE9IF9nupMaem9yK2ia5n1v/9WBmbIxEnxV0yjVXGEaFXtPd
 F/Q36d9JPkZFcTSysTH5PQ0es9AeN0p4TfoGPkBlB9oAT02H+Hc1mjA9INBnW3qT0TLE
 TCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=CaF92eBKzl8YhqaTS1Tzg7cnBN+wgBVFhVH+tqOT7PI=;
 b=kYZEGePwTZDBlUQPHa89PuLX4bt1lB3wAbdKNTLvyLtX/2L17bwq5fB878M3kaXPGT
 zNlJ/oed8oXF0acF/iB0XKomyLfAUOA/DPmKGgJMeRCGfkcHj098piCOt+6av88qjA0U
 mKOEZJ6SweKbEgYnnYUC20nzldDXHRMoTazF8TfrgVBiNoNxedELJ4o3V660bu784a/N
 xh/NdXnMvF2QnoU+r/vKiKoaTLz5nK7W09Ehy24NbGyCRdpBD2rbCV7vy0U3RdBtHsih
 uJKuh9GnsLvzcWKMlh1iJzSNWgHhJBZQmT7Bulvr/Bi+NQ2NdHi32MBvFW02PGzx8mFZ
 7a6A==
X-Gm-Message-State: AOAM533GbK67mx7Bi8K3LhDlzZHNSzs3bnDYYzgcaBrbMkOK9hnprVSj
 Vzam/EKf5pxkpNKrViDpeEU=
X-Google-Smtp-Source: ABdhPJzuSlHddEfPdlSooNCiKn9gKqW9iethwrrpTKVRacgUq5xfLq0fJvrzlLVkrWbJmB72AUE4Hw==
X-Received: by 2002:a05:6808:148a:b0:326:c71a:f33c with SMTP id
 e10-20020a056808148a00b00326c71af33cmr12758233oiw.153.1652706625572; 
 Mon, 16 May 2022 06:10:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 r3-20020acac103000000b00325cda1ff95sm3795450oif.20.2022.05.16.06.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:10:24 -0700 (PDT)
Date: Mon, 16 May 2022 06:10:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
Message-ID: <20220516131023.GA2329080@roeck-us.net>
References: <20220228103142.3301082-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220228103142.3301082-1-arnd@kernel.org>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-staging@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 greybus-dev@lists.linaro.org, Alex Shi <alexs@kernel.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Hu Haowen <src.res@email.cn>,
 intel-gfx@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-doc-tw-discuss@lists.sourceforge.net, linux-kbuild@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 11:27:43AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> During a patch discussion, Linus brought up the option of changing
> the C standard version from gnu89 to gnu99, which allows using variable
> declaration inside of a for() loop. While the C99, C11 and later standards
> introduce many other features, most of these are already available in
> gnu89 as GNU extensions as well.

The downside is that backporting affected patches to older kernel branches
now fails with error messages such as

mm/kfence/core.c: In function ‘kfence_init_pool’:
mm/kfence/core.c:595:2: error: ‘for’ loop initial declarations are only allowed in C99 or C11 mode

Just something to keep in mind when writing patches.

Guenter
