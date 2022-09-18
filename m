Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 996C85BBF62
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 20:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83DE10E097;
	Sun, 18 Sep 2022 18:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D301E10E097
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 18:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Xw0sw6DvY5T9bb+9S9Xpp2E/L75FV5erkBmT6CPqGLU=;
 b=PvDaphVn0Pw5/1auuvFF/vUTgEvaaltaEupLQBGTr33NsIwYGbeu1QxS3fWOqo5Ud5gm9Svw2kftL
 j3TEnIjmHtxAMNQM9+xOGLJ6K0NxvBfvEO7iRFnTcNotl4iNxRoY6cPEqZ34zITqoMSX8A6VXe8CDw
 KgZgllwaMzAw4J5L7/592mwTfWLhZfjTkAlCAvBaelImf35B9tjdx/U+/BUhoeAty9UEjLFRbh7OUZ
 YReKkPf7wmPvWhWDw3aO2kRgXP9wQmVr3A5KVa3A+2GgxBX4zmjn5PVtf6Q5hJpMCQQ6ameLzBNWLG
 lLoNpdHJUEbwX3CDLrmVNswzNT3vZHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Xw0sw6DvY5T9bb+9S9Xpp2E/L75FV5erkBmT6CPqGLU=;
 b=ngEuoLa0TfuBPaYiHI4D8qFzPTz2gVfy3YsboMJfmJ1LRBanLV6fxE24f3Rcgj3SOYgolGfG98wr9
 3oGAekIBg==
X-HalOne-Cookie: cfe33b37d0437c92a151e97a0e673ad70274614e
X-HalOne-ID: ebeda975-3782-11ed-a923-d0431ea8a290
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id ebeda975-3782-11ed-a923-d0431ea8a290;
 Sun, 18 Sep 2022 18:51:37 +0000 (UTC)
Date: Sun, 18 Sep 2022 20:51:36 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: Re: [PATCH v3 0/5] drm/gma500: Backlight handling changes
Message-ID: <YydouJwGNWl6xoNA@ravnborg.org>
References: <20220917205920.647212-1-hdegoede@redhat.com>
 <CAMeQTsZ3Z76QFWgCVPxKdaZ+=KK-9Dqxx9R0G3fs8i3Bob7B6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMeQTsZ3Z76QFWgCVPxKdaZ+=KK-9Dqxx9R0G3fs8i3Bob7B6Q@mail.gmail.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

> > Changes in v3:
> > - Fix unused variable warnings when CONFIG_BACKLIGHT is not selected by
> >   marking the 2 variables as  __maybe_unused.
> 
> This looks good to me. I don't have access to my DIM setup in a couple
> of days so please push these yourself if possible.
> 
> For the entire series:
> Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

I did not find time today - sorry.
I you want to wait then I can take a look in the weekend - but not until
then.

	Sam
