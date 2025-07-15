Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB834B0698C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 00:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5954910E710;
	Tue, 15 Jul 2025 22:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FrmUc7SK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E3910E70F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 22:59:16 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-73a44512c8aso1595675a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 15:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752620355; x=1753225155; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BnsFPQQX9fMc8mZnHVVURxEZg5Aj2fFc9fMGBOeMT1w=;
 b=FrmUc7SK2AMJSfeHKmG4z/PDcGCY2wUwOAPucWWf8tghstUbaj8TE3CjnBnzwP87Hv
 Yb87G/dRd+16iy5I8ZykZOagavsRYs9DaQcBdW5kn3Sw5Ulsdt+alyBfTX90ZRXyuU5u
 y+FjN5Q6Kqrbqw6e1Kms460sjXBlctZjju4vfGrh8lTsIanCeIQiwgk7VYjL3c2Yolcz
 sQj1Qs9eIhqsSCDs0CMj2D2jO0oAuQ7regYWlnDO9uXRGsSsKE1YfM4VfiubXXe5i53Y
 AgzxqIOaQOt+nP0Gtx6XfXHnIzZssonqLe3jflucXOKx9FM84YuDMiq3gg4hgWMQ4uAa
 CD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752620355; x=1753225155;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BnsFPQQX9fMc8mZnHVVURxEZg5Aj2fFc9fMGBOeMT1w=;
 b=Y+k53HRMiCX6bbvxYvIkOKTqtEtnJHNa05AU2+JrLptJ5qiMwy+5KQDr6r0DlIGnum
 PWAG5bssSE4/zuwmI+qWidENWrrZOW1mbfFiM6YLm21z4zfQ5TspSAy3/6tCcKT/Z1vm
 E4oBgxG+Ur6QDM2hoqhVABbWh4n8EcHk2YNmvyssJkQf9dxsn8AEan52/yQMucNDUeKf
 hPauvCUmlcZVgMC4UN4oM8iMkYaUAfu1zfregbEMNuG1qD+rNSRYG1dQxRF6v99/l5aS
 oJ/YP8R05VXgKJAnipf4hjXRRPCCdY1Pf8ISltwBJxCAk0C+9/KcPQhmj86K8TiU6Gvo
 JNxA==
X-Gm-Message-State: AOJu0YztzyGoOhxuQkK7F/KVzVi3uJhuGMcI+drR9EatruAow0WrJIJy
 rDEky4kgP7cDH+K7QIcNVR8oDv/ovoBa3yCXO6WwMfQrETaqA0luff2lDl8gGSpb/lRO6m9+WNe
 vj05m
X-Gm-Gg: ASbGncvtZOY8PaTNAf5L2GWDC28guCWjYOnfKhEdaf+HAfrui5CVx63+iJYj5LABNev
 9hsc2PMTdPAjUYi9tmW7cE0SZw5Mu6ejE+uKNonp/ks1AsMCU6iiBurqOCRjlwcrJZvG6nTEh3x
 KOMdDByyAFPbv6EBspRzRGLGGj4ETTPT69/gi7vnwYHpKUq1ARCto9LC+4+gbdh5aTbq5re97xS
 QIJOBFTkiXsZP6422qvsi4naK/FoxkExpfRmcIh9AZx7gqZEU9YcPrIVXIPkcW9rEDqoxilSOeA
 AnGcCG7qPap0wnHmgmEFtYArpG6ekJu6KN/OG2lDi2sWP99Jwz7lxSZBxUpA79IOV/kA8ox2bIN
 gLXAvy08sthsNRoNZY0TKiOaE4XRyruP0OdlqvjU=
X-Google-Smtp-Source: AGHT+IH0Pa4EbTgpgoFrZOlgckCS3peshir9288PbWdkOLJnnQdwMW9LC5JMwO//cfY2PLCk3mbHRA==
X-Received: by 2002:a05:6830:8209:b0:73a:6904:1b46 with SMTP id
 46e09a7af769-73e64a01712mr1097518a34.8.1752620355684; 
 Tue, 15 Jul 2025 15:59:15 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
 by smtp.gmail.com with UTF8SMTPSA id
 586e51a60fabf-2ff1173040asm2947393fac.46.2025.07.15.15.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 15:59:15 -0700 (PDT)
Date: Tue, 15 Jul 2025 17:59:13 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [bug report] drm/msm: bail out late_init_minor() if it is not a GPU
 device
Message-ID: <6174f797-e64b-41d7-becb-ebe7575871a8@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Dmitry Baryshkov,

This is a semi-automatic email about new static checker warnings.

Commit 4f89cf40d01e ("drm/msm: bail out late_init_minor() if it is
not a GPU device") from Jul 5, 2025, leads to the following Smatch
complaint:

    drivers/gpu/drm/msm/msm_debugfs.c:332 late_init_minor()
    warn: variable dereferenced before check 'minor' (see line 328)

drivers/gpu/drm/msm/msm_debugfs.c
   327	{
   328		struct drm_device *dev = minor->dev;
                                         ^^^^^^^
The patch adds a dereference

   329		struct msm_drm_private *priv = dev->dev_private;
   330		int ret;
   331	
   332		if (!minor)
                    ^^^^^^
But the older code assumes the minor can be NULL

   333			return 0;
   334	

regards,
dan carpenter
