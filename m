Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1586C496BBE
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 11:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C27089150;
	Sat, 22 Jan 2022 10:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F94910E3F9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 18:08:53 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 a10-20020a9d260a000000b005991bd6ae3eso12710878otb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 10:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EdV9jeW0XS2fClTtRWmHZ/pfb6gc0JxRxLCJ6LOKoaE=;
 b=meeX0EanCREvHkjbpCqG1ZNOiORRW+lck5Lrf1ekknEV8tSG9pCQLCeAnEuG4jpXD0
 bafWNuO2n56RKk4TdK9uv2oNQejIRjkllXH6p6aP4C9jAkMlf5+v0rcAW7sSOpN1Qweh
 lxSM31FA4Y43sLimq/jcXuW6eVM6AlExrxl1DXPcd/lnUWTfxapFeQ6Vroc9GMHHkVdm
 97m8GVhmzYVEmE10GbST644VMlhZCQisjDIHKzn7O25SSjVtP5rvi50XqDaxdl970OUf
 fiVIVPlAPQINuvTf/7SDsq/HZuPG3pCZGpJ3TIbB+GHG4qt4Msz5m9tPxcfApIeOkFGs
 jJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EdV9jeW0XS2fClTtRWmHZ/pfb6gc0JxRxLCJ6LOKoaE=;
 b=MG3R98XD45xn35sk/uk7fyzOJNdvS/mJva1rQj4mzao6qKrUvSNDhf381A0uOfnfNc
 QpvgQE6YLeHvh7mH5cv/NK/zlvitHjEcjkUihA/4h+F5nmhb5ruwN4aER6IvkzHQd6W9
 SdKfKmlRnhZvY6TdfTdiSUPKZ0fwI/j4UuxpR/kzv2eVqKQTZmQCHKvL1AQOfVgTVBpT
 9A4FDqqnzupIN5jQcaQQHxeE4eqGkYoqVHkFpjTWvGk4CpRMnUvExPSvqfa7W46b1pUZ
 pFq2oy6Of9X/Qd17ltbbkYz22o+nApWfUo049WdB9pD/ovs0Y6Et0oqlPr6GEtC6rtji
 8qCA==
X-Gm-Message-State: AOAM530/+XkDC7Pv0kYJPgX9shI/CRsiOrLNQJ7MpoYALVDd7AZnYo4j
 iyPKcWRg3sjjkEawrFX8Nhc=
X-Google-Smtp-Source: ABdhPJwUwR1moHUHUerjoZQiDlOouzASByE3AZ2eOElQtAiRB0NohFq9+NrBSRM+s/N+I4ND4sgA/A==
X-Received: by 2002:a05:6830:2788:: with SMTP id
 x8mr3568081otu.349.1642788532834; 
 Fri, 21 Jan 2022 10:08:52 -0800 (PST)
Received: from thinkpad.localdomain ([2804:14d:5cd1:5d03:f1a4:cff3:1fd1:7bc1])
 by smtp.gmail.com with ESMTPSA id
 m14sm1161490ooe.20.2022.01.21.10.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 10:08:52 -0800 (PST)
From: Luiz Sampaio <sampaio.ime@gmail.com>
To: daniel.thompson@linaro.org
Subject: Re: [PATCH 24/31] video: backlight: changing LED_* from enum
 led_brightness to actual value
Date: Fri, 21 Jan 2022 15:09:48 -0300
Message-Id: <20220121180948.2501-1-sampaio.ime@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121170540.w6c4wqwrqzpde2lm@maple.lan>
References: <20220121170540.w6c4wqwrqzpde2lm@maple.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Jan 2022 10:44:23 +0000
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
Cc: linux-fbdev@vger.kernel.org, michael.hennerich@analog.com,
 jingoohan1@gmail.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lee.jones@linaro.org,
 Luiz Sampaio <sampaio.ime@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello, Daniel

Thanks for your reply. This is one of my first patches, so I am still
learning. This series of patches affects others subsystems too (hid,
leds, sound etc). Should I create series for each subsystem
separately, instead of creating one series for everyone?
What do you mean by "this patch might wants to land in one tree"?

Thank you for your attention!
