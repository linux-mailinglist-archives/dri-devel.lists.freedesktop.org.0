Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C922FE76C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 11:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8509895C8;
	Thu, 21 Jan 2021 10:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05530895C8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 10:20:46 +0000 (UTC)
Date: Thu, 21 Jan 2021 10:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1611224443;
 bh=NS6jIL1HjYTGB056Lzh6PU4kdZhf+ynx4UsW9FFdNJE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ungU9saH7Fmh3X9R6YqzPltWK/RnLGdSoGiVod8zlF6rBH4UNt8uca423m4EesFHq
 T4d7Dnn9vOHjteazVmNvxiGQ0vetkeoZJmX3YBOUwm5X/cbRAZ2H7LnTqJ/SQukpnY
 QYZZAw1qxRKDYkap37EcsFS+J27SdiduurgBphK4mtmn+/ffw2kcmKoaBnCOFMtifN
 JCHKqhbtkX2qs7Va4hsQnAcfnxPOz7LE4y17Ng/vCF+uZA67bZ3tHIy634fnE+yjV8
 b+xYBDlN43G1D8TbEWcZAU+YYWwDbBbYQPeCaE0Xon8QmpmauA9zNCNPxMkz5SPmGA
 sAfss8vVAM9AA==
To: Thomas Zimmermann <tzimmermann@suse.de>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4 0/3] Generic USB Display driver
Message-ID: <-aBHMpNW0jmn4TF7fGiParPvZuVdzM0H0UGlmc0KGpZYJlBGkL-xq0ooPGErY0gl9iF9C7Il5jfFApcYHfypL06iv-6knlp7B6D7HfBhANc=@emersion.fr>
In-Reply-To: <ebda4ea3-3352-f35f-883e-6db751d6ca8b@suse.de>
References: <20210120170033.38468-1-noralf@tronnes.org>
 <ebda4ea3-3352-f35f-883e-6db751d6ca8b@suse.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org, th020394@gmail.com,
 lkundrak@v3.sk, pontus.fuchs@gmail.com, peter@stuge.se
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, January 21st, 2021 at 10:59 AM, Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Well, I'd strongly ask to not call it "generic", because it isn't. We
> have other USB drivers and anyone can make a USB display with these
> protocols as well. That doesn't make them generic. A USB-standardized
> protocol would be generic. Maybe call it custom, or home-made.

Maybe rename it to "GUD USB Display driver"? :P
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
