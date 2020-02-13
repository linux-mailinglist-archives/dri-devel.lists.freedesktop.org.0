Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2CB15B8A2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 05:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8103C6EB25;
	Thu, 13 Feb 2020 04:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F4D6EB25
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 04:32:39 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y17so4980479wrh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 20:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B+OX12SHDSMKMFGDFB0totmCYpvIHkn+emsxqw7J6Sk=;
 b=yYu7Sj7BauPrWR+fmBXpNgnn06aajj/kzhaoI1NNiuCzkWfpR+Prxkkp4v6+LC3zG6
 LOUjgk7erW6dv3jmL9jXmjDqvoFmSDSQbEEvbyBYRh1DQ8P5BkCUPuPuxqa8bTnotLyn
 x42ShhvmEdVUA3ugUFqnYERTQr8YaHU+aSjGOuPmXRMnYowgHSmkijrI24vEU7MbUDky
 WQ0TjnutMSSYCJi6eKh7ncduUnmAXexk2HUuPBYy/xJ/INFjE4J4Lw+yCsLeLZ/KnU+a
 E1FcEpHwuQtQJNck/QZdFnZyKMPQywjYyvmZr98d9Wh/6CFfE34SVzYJo0ILIzs9pbxW
 qz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B+OX12SHDSMKMFGDFB0totmCYpvIHkn+emsxqw7J6Sk=;
 b=DNFzfU6xPvC9o/5CQ+kf3SQ+SW7SAy9D9ZjewZ41auRVDLtgJH+SYAXCZF9g0inPIP
 aEHSPSBFROiTPlb7NgLUlhNejFTNXsa8tBTbULnEjRVHCXH3sH/iozIIDjBgGf3AD2MQ
 2uvKBEKozt4o+88fATJLLkTF6xF5aTZJvy5Qjxmy+Z1jpF+K4r1HMmSJ5cE61IWBv092
 I++n0lmfIP0feDsE313McBUDK2q2Tn7DHUYh91dn9fCzEdfZYm7lYBzDpKlA8sS09Co+
 ZDhWg5Y0fBgSWUS41IBI0T5Y0PgzyrynSTPwZ8sbtlaQgh8bOfpcOiOGZonw+iNS+Iqe
 lWgQ==
X-Gm-Message-State: APjAAAU7kmm6gqCWaFf8eD6r9wZeCHSkUfcxBBa6C8eGZD3l9Sf+ZqjF
 Ko3Qb1prz4we5cKhQ5QNKPYzURg8YhgIlkp9bx5+tA==
X-Google-Smtp-Source: APXvYqwekVscGZ8Z3OqonwwK1/LCpxiQf7pZqmNC9iN8Xwva7oefGCP0hfJFj5yB7Gxb68n22vOBa75U6ftrJAsmMds=
X-Received: by 2002:a5d:6292:: with SMTP id k18mr18956805wru.256.1581568357602; 
 Wed, 12 Feb 2020 20:32:37 -0800 (PST)
MIME-Version: 1.0
References: <20200131214109.6323-1-juston.li@intel.com>
 <20200131214109.6323-2-juston.li@intel.com>
 <20200205222553.xi6uv43a4hfgleqi@intel.com>
 <e7726590ddb5c8007f3d146a7182927d8b0d0050.camel@intel.com>
 <20200205232726.eoiiije62mdzv6tu@intel.com>
 <d3799f09639f763f548ba7fdbdea604c2c29e7f7.camel@intel.com>
 <20200211122139.pcf2xqtpfmgrfbn4@intel.com>
In-Reply-To: <20200211122139.pcf2xqtpfmgrfbn4@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 13 Feb 2020 15:32:09 +1100
Message-ID: <CAPj87rP+RG9jSTzQMArtKyDp=Avan0k5ax7b98VV2FLGXWwjbQ@mail.gmail.com>
Subject: Re: [PATCH v4 libdrm 2/2] Add drmModeGetFB2
To: Eric Engestrom <eric.engestrom@intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>, "Li, Juston" <juston.li@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 11 Feb 2020 at 23:21, Eric Engestrom <eric.engestrom@intel.com> wrote:
> On Thursday, 2020-02-06 17:46:36 +0000, Li, Juston wrote:
> > Yes, drm.h was copied from 'make headers_install' from drm-misc-next.
> > It had been updated fairly recently so GETFB2 is the only delta.
> >
> > Sorry, I didn't see the README so the commit message isn't exactly as
> > requested.
>
> I kind of expected that this was the case :)
>
> All good then, with the commit message adjusted to make this clear,
> patch 1 is:
> Acked-by: Eric Engestrom <eric@engestrom.ch>
>
> > Also, only drm.h was synced, is that preferred or would it be better to
> > sync the entire header directory?
>
> Usually people either update their driver's header and core, or just core,
> so this is fine :)
>
> I assume DanielS will merge this for you?

I've merged this now, thankyou very much for pushing this forward Juston!

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
