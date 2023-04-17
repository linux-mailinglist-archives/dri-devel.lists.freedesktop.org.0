Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7776E4187
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B3410E3AC;
	Mon, 17 Apr 2023 07:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCA110E3AC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:44:44 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2f62b1385e3so741945f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681717482; x=1684309482;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q//e7qaqughnPCo1F/i+SeOq6/eX66Ej8mh5j/ct1pw=;
 b=W2mD0MPRAkuFA3FfSr2vuJMF6S3FrJUcuA+8gz/Pfwe5nOBHdp06855HRV/c3AMXBB
 KVUuRdxZ7uwMww2K2XZ0KXCooWYIlU0nx8c6CPANcXuYxfO9f0Dt7qrBL8Aj306lLTLR
 1IYKSmyq1QzG2zovl6y0xqjwEkEJ1Lomu3rCOccWvTM26H+FsglTQ3AX5INCBQY2b/dO
 CNN3nCXOM1H4orljD0v4I5IWURH6RgczeZYWial/x+sBnwZOV3yIydmWnBpTvQprpB/z
 axgmH84N8pIRzICg5yz+cbAaREVhConb3FQ6E0Z+Sq4zh/Mz46GY1UeqjjoXUg+NKVgt
 bVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681717482; x=1684309482;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q//e7qaqughnPCo1F/i+SeOq6/eX66Ej8mh5j/ct1pw=;
 b=ktKxmsGZY5hmV6OfCXh2QqdLbNLtawMknQQ7L5etGp7i7S09UyX1mLa0+DY3rK2qu0
 jVj7i6m8jyJC7IGFdshyNz+do1lMqvVFqVZdVZBPQh7ylHJ7cVAy8Sz0q1C54ANzS/Wx
 KlH2TJFvU9LZuEc+ROIJJRLtGjPg8tOl7fIDfnZ/liRG1wtHo6kMLqubuENTaml3tlh0
 68HW2nTfu5dP00pgMUxqinA0BNnH8mGr2OpuDIz92jLie4UIX9YqDzTfhE6UvODmzD/P
 SeqRTMxYzKjcEYHXKpjWcV1DidqOlRB9uVzLG3IbhcOsRoBXjXOovUjHQX14JwcG/vPP
 CtDw==
X-Gm-Message-State: AAQBX9fKNxeB6lKQOHc2dnfHgU41nyN/rVH6ZU5WNeKe1FBHV7ECvq43
 ogb+uhXDM+kBI+Uz1lcBFd+Jzw==
X-Google-Smtp-Source: AKy350ZOVLQAlAzQbeb7qqULkqACRYkBlRFZOitvcvISxwquy2k86KPJKTIUe0y5GgOYg6CQjAjJuA==
X-Received: by 2002:a05:6000:100a:b0:2f6:9368:63c5 with SMTP id
 a10-20020a056000100a00b002f6936863c5mr4694914wrx.10.1681717482001; 
 Mon, 17 Apr 2023 00:44:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 k16-20020adff290000000b002f53fa16239sm9826899wro.103.2023.04.17.00.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 00:44:41 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philippe CORNU <philippe.cornu@st.com>, 
 Thierry Reding <treding@nvidia.com>, 
 James Cowgill <james.cowgill@blaize.com>
In-Reply-To: <20230412173450.199592-1-james.cowgill@blaize.com>
References: <20230412173450.199592-1-james.cowgill@blaize.com>
Subject: Re: [RESEND PATCH] drm/panel: otm8009a: Set backlight parent to
 panel device
Message-Id: <168171748107.4136849.13756409513746780386.b4-ty@linaro.org>
Date: Mon, 17 Apr 2023 09:44:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 12 Apr 2023 17:35:07 +0000, James Cowgill wrote:
> This is the logical place to put the backlight device, and it also
> fixes a kernel crash if the MIPI host is removed. Previously the
> backlight device would be unregistered twice when this happened - once
> as a child of the MIPI host through `mipi_dsi_host_unregister`, and
> once when the panel device is destroyed.
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[1/1] drm/panel: otm8009a: Set backlight parent to panel device
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ab4f869fba6119997f7630d600049762a2b014fa

-- 
Neil

