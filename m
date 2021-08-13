Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B863EBCAD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 21:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D366E8D3;
	Fri, 13 Aug 2021 19:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C3C6E8CE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 19:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=vGxwLQwFO2S7TTjs1yBKTvR75GNMnpeXiG3mZABQ1io=; 
 t=1628883903; x=1630093503; b=Om2Q0INZinv8bLnqlB9JF3F7Zve+jjWpJ/ihfA8Hax+rSkI
 bd2uFI5a0/y7MQnkYojmBLEl8/3ksQPja52y04Zbn+ViR2hp+7zsZ9oiLzwedM+mRGHtekL4ThQBU
 WQGOLAUVCV9Ns2mgH8gH64KydGEhWOWjMYrhTSdvPZCdRuxzEPzcjeuSFWOTAzTnWHfodSem2jhu6
 UHJBszouULBMae2jsueKJTEheweMuMxavuZWWFEvM+Jj5GSBxiOpvHgcs1eSGYc+zucsHHnFSU37C
 hdfY38XD1qX66FdGGPKt8l6bE1KXaGvvpOGyiUrmfZRxAZHHSl0noxK9KYz6WKtg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mEd6u-00ANL4-Up; Fri, 13 Aug 2021 21:44:57 +0200
Message-ID: <6488ed24d2ce0ccb1987c271064e25bc72c30863.camel@sipsolutions.net>
Subject: Re: [PATCH 10/64] lib80211: Use struct_group() for memcpy() region
From: Johannes Berg <johannes@sipsolutions.net>
To: Kees Cook <keescook@chromium.org>
Cc: linux-hardening@vger.kernel.org, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Keith Packard <keithpac@amazon.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>,  linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org,  linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com
Date: Fri, 13 Aug 2021 21:44:55 +0200
In-Reply-To: <202108130846.EC339BCA@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-11-keescook@chromium.org>
 <a9c8ae9e05cfe2679cd8a7ef0ab20b66cf38b930.camel@sipsolutions.net>
 <202108130846.EC339BCA@keescook>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
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

On Fri, 2021-08-13 at 08:49 -0700, Kees Cook wrote:
> 
> Ah! Yes, thanks for pointing this out. During earlier development I split
> the "cross-field write" changes from the "cross-field read" changes, and
> it looks like I missed moving lib80211_crypt_ccmp.c into that portion of
> the series (which I haven't posted nor finished -- it's lower priority
> than fixing the cross-field writes).

Oh, OK. I think all of this patch was cross-field read though.

Anyway, the patch itself is fine, just seems incomplete and somewhat
badly organised :)

johannes


