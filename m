Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4840BA5E52
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 13:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15B010E037;
	Sat, 27 Sep 2025 11:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JS3P+GEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C1A10E037
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 11:21:55 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso2251228f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 04:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758972113; x=1759576913; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OJyQSRK24ueuJ/t9RVW/5PZ17kfoy2c3bcXVjbrW9QA=;
 b=JS3P+GEqEVJ+3dCFkMIKrCDZrM/csikv+XFONAHt5bqiSR0VC+GqUO7saEBIHWr4GX
 hFlwwGeYYeX6FDjov7QXTHDp1vIHpvk1VfgidNJLVSvmJ0NCDqXoQFaZeaMqoa1t1VpB
 vbfj51V2bP94G2cIE6rEkUqoeqKa7NJUg/+JmBRgXMYdrH8rLp2uOh/5097i1s96axo6
 F1k5bDHWty+n6iAYMo+7WDaKPEB1JbReSeevNWk3xjWZJLlYCHqa0OH2nC7yuvcUWXUZ
 WIlLlyPw7eVbwVMH9oQ8Mr8hzLMKcHrDWWvNJ2aqcxMSdRPEKUFHZJucHxM1H2JtKlbc
 v/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758972113; x=1759576913;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OJyQSRK24ueuJ/t9RVW/5PZ17kfoy2c3bcXVjbrW9QA=;
 b=n7h7/147BdoXrZ8QES9gompioLxXor+EFv/oCDoq5psGFVznWzwFiL2VsdqUAFpOP7
 HzpeOZMl4fiYj+7cOrZXNeu+kr0etv3i1FuZy/SD5vDO2dFHJS2YKBuZUPtwkP2k1v8n
 ZdZYk7Ux61nqH4oZN52ISA4hkmJ830RZspITaDq4pjCLfHMNKr8dTnw2f3JisYimq/+I
 ftq3rKpGZ0yUR5jQSDroy2dwOv9JG02AuOP6P7/JBSQEzq0wO+IKA0jopGMHr9+ao/xz
 QjzYN059r/E4pEM5ORVO0e16bm+DlzSXyrUcpvRqxt1D/D5Q4JEuiQXThpfl3k3BYGEW
 fN7A==
X-Gm-Message-State: AOJu0Yzi/I2Vofyy7zptbGtVTJjac9jfOpzEgMwB8ah7gO/1iLzh7S/F
 kztjjZuVr92+tLWShoAwSxG0E6i0FSCYUuAN8vb2eFL7XrYr3xKkO/Nn0sWlkvpucjg=
X-Gm-Gg: ASbGncus/bjhQC7ntrcjDQVTcmAlnVODqRNBHOvBAxHaACNrivXp6iWpGHZs2Gm/A2e
 ht2PptorPXDGSJWxzZfOB9J03EtbzAqq6/q2DHZAzta2jY6DnKWGIs5vdZfwpUrZJxOm0kzTOwn
 gBtmXG0j69Yli1H1JVaHSjSKuFPm8jYDoj8/hHbHc43ZxE1aqeZGD8LQDYDkV5GuO+leLvsXOyg
 esLb5Os4IdJ4aIsNTON1curkVVnQ7fe7P6PMfLFFBZiYN8rRQNaxB6q9SU+1cDR8Wzp6E25k95m
 kGmd6R5z7Y9T8kigOfJrXYQY8D+LgyVTkMfYC+yLrgpqCZlqcKFerDPYsfDtcdOSunxThXhpsTj
 KoTsgaDi1fCfzBk28CjJ0frJce6VDZX3rsSwzPMKab0jSBeSf7g==
X-Google-Smtp-Source: AGHT+IE4i6tKenYdieu78NdlcZcv8UUt1c8AxkG4RozvA7fUiVTUMCeam+yDYyWeMC6rNHSTkP5CDA==
X-Received: by 2002:a05:6000:288c:b0:3ec:c50c:7164 with SMTP id
 ffacd0b85a97d-40e47369ae5mr9772162f8f.15.1758972113137; 
 Sat, 27 Sep 2025 04:21:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-40fe4237f32sm10486412f8f.63.2025.09.27.04.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Sep 2025 04:21:52 -0700 (PDT)
Date: Sat, 27 Sep 2025 14:21:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Sinyuk <konstantin.sinyuk@intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] accel/habanalabs: add NVMe Direct I/O (HLDIO)
 infrastructure
Message-ID: <aNfIzF_5MxSLX9Rn@stanley.mountain>
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

Hello Konstantin Sinyuk,

This is a semi-automatic email about new static checker warnings.

Commit 8cbacc9a2703 ("accel/habanalabs: add NVMe Direct I/O (HLDIO)
infrastructure") from Sep 9, 2024, leads to the following Smatch
complaint:

    drivers/accel/habanalabs/common/hldio.c:106 hl_dio_fd_register()
    warn: variable dereferenced before check 'bd' (see line 98)

drivers/accel/habanalabs/common/hldio.c
    97		bd = sb->s_bdev;
    98		gd = bd->bd_disk;
                     ^^^^
"bd" is dereferenced here

    99	
   100		if (inode->i_blocks << sb->s_blocksize_bits < i_size_read(inode)) {
   101			dev_err(hdev->dev, "sparse files are not currently supported\n");
   102			rc = -EINVAL;
   103			goto fput;
   104		}
   105	
   106		if (!bd || !gd) {
                     ^^
Checked too late here.

   107			dev_err(hdev->dev, "invalid block device\n");
   108			rc = -ENODEV;

regards,
dan carpenter
