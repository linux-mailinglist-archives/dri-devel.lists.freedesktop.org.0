Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1181637572
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 10:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38FE10E080;
	Thu, 24 Nov 2022 09:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F8B10E080
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 09:44:14 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-3876f88d320so10587997b3.6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 01:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cm3vAmeocbFT2WUKnv6ZhMoxulICH/ZBbc9Pjefv5wU=;
 b=EeFiY/PSLzCnyCYhKnMPO3Cw1UiQQq0DIIJYoLMEXqVN2vyA1MUepGCuZ1vIvKRv8j
 luG/46+67nAkVZollBDBljoZVfPMi5i5zbaiovRRVZlUmTp+8CsujK+ge2b1xLmphAOu
 0qutQm9QP62ucXSAU7JMGYRQn8mLFC6KEx/1YYoTdvCmyJEUgO8tSuZYZXLikSziq2qw
 8JQE4aGwsBCD+YrRIxDCg5tI7KO8zyW2TbqGLtH+oxLl+XpTZWRtWDeyV6ipwJ84GOTM
 vS3aR5XHbNKkwZB00fWNE/RpRVGgM2lALkjMken9scvEcM2yPW5l8KbsX1OcVL/UsDPZ
 GGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cm3vAmeocbFT2WUKnv6ZhMoxulICH/ZBbc9Pjefv5wU=;
 b=CcEQ1XE2ibC2eZI5NKZTg9ZgdZEV8BGjcTIlAfdjQVVOtJMp/XC8tZWUaWVkUxRJYk
 kJklah/cYBhfAnt7dx+G+CLnlTI54yi1XfqwsUc2xV/oYlgSFHc1lsubHQ3o35HSSbBR
 exifRSTUgR3yn6XBCMiW2LBgn+u8ZIXytrOq9I0V/idI7aSo5/Pzveu/uNe8gMI22O/3
 UVpOYX+jW66hRmpx0WwJgDLhG6xXLaBSF94ZE7DWCIuxr1zb0O6I0bBEujJjGo+q0zTb
 ktQ0DiFt7BDrOqupySIH7SREBqeyDh3fQRLMqGIF4N/aNaVwjln69yjbUlpiUtkuDWmM
 1bnw==
X-Gm-Message-State: ANoB5plC0gr7ZThCOSpRmpp0knIywbVtE8fS3uzS2S8inADBeskBVKmO
 1s2ctN8R7p8PXcRyfFbBOGdqHfgc7exE0vbjpwAD4A==
X-Google-Smtp-Source: AA0mqf5X112cEoeVWRyE9CnA7boYGz4w4mIHjcLzL+YseLgdq0JijCHfFdfmpalg37J5ozevJskT689VbKx3j+5UEfE=
X-Received: by 2002:a81:a18c:0:b0:394:9bc1:c29b with SMTP id
 y134-20020a81a18c000000b003949bc1c29bmr27338268ywg.304.1669283054057; Thu, 24
 Nov 2022 01:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20221123192437.1065826-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20221123192437.1065826-1-daniel.vetter@ffwll.ch>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 24 Nov 2022 09:44:01 +0000
Message-ID: <CAPj87rNOH5dGs2aGNzY-nuw77ue4+fBwgmcoznLjKEERg1i46w@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: Document open source user waiver
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Trevett <ntrevett@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Nov 2022 at 19:24, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> It's a bit a FAQ, and we really can't claim to be the authoritative
> source for allocating these numbers used in many standard extensions
> if we tell closed source or vendor stacks in general to go away.
>
> Iirc this was already clarified in some vulkan discussions, but I
> can't find that anywhere anymore. At least not in a public link.

I seem to recall the policy being set in an IRC discussion at some
point (or perhaps during the AFBC merge?). This is a good
clarification of what we already do in practice.

Acked-by: Daniel Stone <daniels@collabora.com>
