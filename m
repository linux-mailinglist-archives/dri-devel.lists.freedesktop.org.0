Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A365D91AD45
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 18:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B953010E21B;
	Thu, 27 Jun 2024 16:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eA84aewe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4981010E21B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 16:55:49 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-7180e5f735bso1390876a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 09:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719507348; x=1720112148; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5s1GCZEfuoRlEtDfGX4Z4uRrKQp7qaRojctirsO209Y=;
 b=eA84aeweuD9wkKqzR6RWBQnxPwW+UJ9W2gzZBEcWTNW3MWgjbZCbS4oV7pcODV7m0o
 pF2I7EaYb9x4bogzaUk83z6PaVK4uamWKYgwh1cXUous0IPYqKOWDUOBudcDC4hSWEjG
 E6OZsEw26OTVpgn0K29HhIDOc6i60yrJ0AAKZwImuoyh0mNCvmEvAFddBAw3AUpSbUJz
 uhpbF9jvM26lO39gdDKAbP1dvvORvjeocHmYBU1LXOv5zq/S8M6VB7tfC3PjhSkx9LXS
 vQ84yQa13pPu0Uf7myCbr+DdXx5qzCWSle7lsvxaerzWmu/Zv45cLfQeqGm7dUA36X7N
 mUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719507348; x=1720112148;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5s1GCZEfuoRlEtDfGX4Z4uRrKQp7qaRojctirsO209Y=;
 b=q4whFTLNl9rYm2p+QPYAKdittBj2ifcSYEPEpMJYRvRUuELVBh1z9h+uVWlPRD+lr4
 QdjyDNCb+rdObFAnSvO4A4fG7FjwtHHweTx4jhl5w8UVwR5xQA4934vdy8CcmsTG4o27
 2YsqVE1g5KMeenkBpiGJrlz/0QVlKRxnFHKJjw/O1wb8sXd6XcNF+b1U1q9nzXgvtVOF
 GyObFjyWictqotabkYcUKf1FwNwDXFPRXUN4uBV0evRGflUC/xMkrEjDVr4gpRJK8pye
 5e++ZJGGbrrfNExhu40qwJ8/SBHnHpUh8u2ZPjbHyG7wL1BoYkkkSqAtQ+CNb7uAIk2D
 LM8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpGUx6qkL6snVzsDRow5oanaW0Uqipmr5uFA1o4NECA3cAdAmpOiPaDuAsn3LoPvGHDkfrk2JePHN9m5d6IttXgu/zB3F33jieTZU8okh3
X-Gm-Message-State: AOJu0Yy93c5UFYuGrn0XCR06lQ6CtH6O92S7ocGG4kfxx+nzkPby3Yg2
 7EQG+u4C3dRJE19FTVwse3LgippBDjflOm0M8bkpzvg3tugRzbMp
X-Google-Smtp-Source: AGHT+IG6BL8fEiaMXCecNTPZwvWd+gBRgHcwpMbKnA2cp6Z6UbQEM8oUa0CJwRE9vNd+622oh685uA==
X-Received: by 2002:a17:902:eccc:b0:1fa:3a30:dc8b with SMTP id
 d9443c01a7336-1faad004f06mr35978975ad.3.1719507348398; 
 Thu, 27 Jun 2024 09:55:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c4ea:7ce4:91ae:d360])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1faac99a30fsm15859035ad.223.2024.06.27.09.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 09:55:48 -0700 (PDT)
Date: Thu, 27 Jun 2024 09:55:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3] software node: Implement device_get_match_data fwnode
 callback
Message-ID: <Zn2ZkcT5fsUrYUdJ@google.com>
References: <20240427203650.582989-1-sui.jingfeng@linux.dev>
 <ZnXbaubPVAUdDIu0@google.com>
 <7b5305b6-78b0-4add-9e70-271159cfad95@linux.dev>
 <Zncl_O-NjMRZYGeA@google.com>
 <ee4e8724-4a19-4814-9b7e-9eb6eb0ac6a3@linux.dev>
 <ZnfVoQmCE-wJbIYU@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnfVoQmCE-wJbIYU@google.com>
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

On Sun, Jun 23, 2024 at 12:58:25AM -0700, Dmitry Torokhov wrote:
> On Sun, Jun 23, 2024 at 03:38:23PM +0800, Sui Jingfeng wrote:
> > Hi,
> > 
> > On 6/23/24 03:29, Dmitry Torokhov wrote:
> > > > In case of non-OF match (which
> > > > > includes the case where you use software nodes) the match data is coming
> > > > > from matching spi_device_id entry in the driver.
> > > > 
> > > > We don't care about much how it is probed now, rather, after the driver
> > > > probed by a non-OF way, how does the additional devices properties
> > > > can be get?
> > > > 
> > > > 
> > > > Say:
> > > > 
> > > > 1) "device_property_read_u32(dev, "rotation", &rotation);" and
> > > > 2) "!device_property_read_string(dev, "pervasive,thermal-zone",
> > > > &thermal_zone))"
> > > > 
> > > > 
> > > > For those spi/i2c/platform devices, what we argues are that
> > > > those drivers really should just depend on "OF" before we have
> > > > a reliable fwnode API backend to redirect to.
> > > They are working fine without such restriction now,
> > 
> > 
> > You still *NOT* answer where the additional devices properties[1][2]
> > can be acquire.
> > 
> > [1] device_property_read_u32(dev, "rotation", &rotation)
> > 
> > [2] device_property_read_string(dev, "pervasive,thermal-zone",
> > &thermal_zone))
> > 
> > 
> > > so I see absolutely no reason imposing this restriction.
> > 
> > The reason is rigorous.
> > 
> > You are acclaiming that works by hardcode or by ignoring the flaws
> > is fine, then all driver are working fine by *your* standard.
> > 
> > Your personal standard has nothing to do with this patch.
> > 
> > > > Where the additional device_property_read_xxxx() calls redirect to?
> > > > 
> > > > What if users want to invoke more device_property_read_xxxx() function?
> > > They are being directed to first the primary FW node instance, which may
> > > be either OF, ACPI, or SW node, and then, if property is not present
> > > there, to the secondary FW node, which can be either again.
> > 
> > 
> > What I'm asking is, on the non-OF and no-ACPI cases, where's those
> > device_property_read_xxx() calls can be directed to?
> > 
> > > At no point ->device_get_match_data() callback in involved in this
> > > process.
> > > 
> > 
> > The patch is written for people who need it, not for people who don't.
> > 
> > It will be involved if the device is associated with software node.
> > Its for fwnode API user to get a consistent experience, that is
> > to get a matching data without introduce extra/duplicated match
> > mechanism.
> > 
> > The patch is focus on fixing the undefined behavior, is discussing
> > the correct way to consolidate the fwnode API. Its not going to
> > discuss how does the those *old" and/or how does those non-fwnode
> > systems works.
> > 
> > Its NOT discussing how does the driver itself can be probed, a driver
> > can be probed multiple way and is another question. Being probed and
> > extract matching data can two different thing and is perfectly valid.
> > 
> > Your problem is that you are not fully understand what other people
> > does before you rush into the discussion. You are putting restrictions
> > onto other people, while leaving the problem itself there unsolved.
> > 
> > Its not a place to express your personal value or you personal status,
> > such as, you are "ready" or "not ready" for something. Or persuading
> > somebody should get used to what or teaching people to talks with a
> > whatever tone like a God.
> > 
> > None of those junk words are technical, I can not see constructive
> > ideas.
> 
> Yes, indeed, it appears that further discussion is pointless at this
> point.
> 
> Andy, Heikki, Greg, and others: FWIW this is a NAK from me.

Even though I said I will not discuss this topic, I stumbled across some
of your patches to the DRM subsystem and it looks like what you want is
actually to help push through this set of patches allowing buses (such as
platform) define their own ->get_match_data() callback so that
device_get_match_data() can be used universally:

https://lore.kernel.org/all/20230804161728.394920-2-biju.das.jz@bp.renesas.com/

Thanks.

-- 
Dmitry
