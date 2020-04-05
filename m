Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6E919E9E8
	for <lists+dri-devel@lfdr.de>; Sun,  5 Apr 2020 10:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978106E0A5;
	Sun,  5 Apr 2020 08:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEC36E0A5
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 08:26:51 +0000 (UTC)
Date: Sun, 05 Apr 2020 08:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1586075209;
 bh=PKuXJcNVDwbAyluqNuchxpWyvsejUt70gD9vG6bVxvU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=nd4AeqFkRmRGJQNuO1iygYg6FAVyHvn5Q2fjQ3bWkBkNH0+I5EeoGvS0OEFYQgW7c
 ZJrSxoBsV2jcwJ3X1PZAtCZp+0S93yONo2Cu5GIIlI6phZD6yXrjxMoK0s1p0WaLML
 6D3Xu8Mq/vPndYF9RRdoKqVs6lrXgnvHdA7jNpig=
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Curtaining API / Force blanking displays
Message-ID: <H50uAjO6Wr3l6Eq6VP_ob7QiLxQHg-v3VHklt33SGBnypo6xBI0ABx9tzy5c-cizfVErmULc4lvFe-NTTfU90FpOiIHlUckuv_5qrajqo5A=@emersion.fr>
In-Reply-To: <20200405112131.1b2c5fc0@ferris.localdomain>
References: <CAN=K5G92HHwFqH4FPeqfJkD-hj8HJBy+7dTWEg55BP_HnHFjKw@mail.gmail.com>
 <20200405112131.1b2c5fc0@ferris.localdomain>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Erik Jensen <rkjnsn@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I completely agree with Pekka here.

On Sunday, April 5, 2020 10:21 AM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> I have heard of such a screen scraper already existing, maybe Simon
> remembers where one is?

Yes, ffmpeg's kmsgrab does the same thing. It doesn't support modifiers
and only grabs the primary plane. It comes with all the other drawbacks
Pekka mentioned.

Simon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
