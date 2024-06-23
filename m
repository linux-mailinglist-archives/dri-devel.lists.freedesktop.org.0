Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFC29138D7
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 09:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F9110E0E9;
	Sun, 23 Jun 2024 07:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wxt19sa3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C48F10E0FA
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 07:58:29 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1f9cd92b146so26050695ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 00:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719129509; x=1719734309; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tzKNaXqjYLYXB0OpmzE6jKXefCOFO+eG6hhbZpLsjY8=;
 b=Wxt19sa30Syh7e7ijxuCi2kkjWCzTWZSukO48gwkL1ccyfI0Az4679F1dkyiosocN/
 FY4Ys7qEKCdJkb75YeGeIxqboBad7mAdUQlKjYgCr3n1fGWqCnF+8JDBYVfLuwz9KW5N
 UtYbUSYMreazW44/8exwrqDSqDILo+RebnNb7LlqXM5eo5Gm7Iyn8c0ihJsYYFbPum8b
 gT0xGXwMtC7UEpPc7gtlRTlfgImfjnH0qnBkjVlJphxrfxnhzC0agCHMCKDnpZfA+9F7
 8XtBh4kUPr8JSu3pPvgg2htNBizngKsstZnDIHvMPI+bdqV37CMOk6Uem2hfLFIfh9fn
 Q3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719129509; x=1719734309;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tzKNaXqjYLYXB0OpmzE6jKXefCOFO+eG6hhbZpLsjY8=;
 b=o9IXbpEtHYjjcjxBSEupR9C9QUxNaOWBoGC1W1qQ0CENgkiNxAd8GpglJKOM+/TKOs
 epJ1nCDdp0aOjmLiLkDDjJStGRnoKkSzkgwLsnosZ6uLczbkWQR+w0YjSItehF8fOzqd
 XBLNBXXmBR9LtpR40nNDAMburZQW2PP4iB0Y+5tl9WY1rJjK8Hdf0418pRaE6+GRTGWo
 hZ/D2z2HfakpgGzmOj+KC6u4dRpETzZ6vVhs25edlFssu8IPXJg2JDCA5EiEp2T4DSGe
 d90XmbQb7mnGgymrOHL5ypgxZ0k+xLTixovgUK6pCrOJW9Q2hzgwpd+FdLk0pwrre6Wr
 WRGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb2kWlEIE4j5LVLPslJ5BM5NhTZz62J4OJsU1o/PBt7WWhxIZeGW/hqzaIPDKnLk10roqJhwHnYVIg7VsOPM+e39k/re+xa2CSDtQ3Alrl
X-Gm-Message-State: AOJu0YwsWaywk06UXf7JYxgYc26GwlRuhMV1+keZPh2eBaq+mZv4jYt/
 tgZ4o4SJstRFVuqk7a03vu6dTg/UtnK4OgRLB0MnqPOOE9dUgHaV
X-Google-Smtp-Source: AGHT+IGEpWbbny726Q3htn6XKcMmi4++Fu3v9DNQtTRzF7a9NIY1QXUPMWFlEmnWJ72ew/+300ULFA==
X-Received: by 2002:a17:902:f648:b0:1f9:cbe1:ae9 with SMTP id
 d9443c01a7336-1fa1d66823fmr31602725ad.44.1719129508450; 
 Sun, 23 Jun 2024 00:58:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c8b4:4b16:721a:ce0f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb2f02f0sm41610825ad.7.2024.06.23.00.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 00:58:28 -0700 (PDT)
Date: Sun, 23 Jun 2024 00:58:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3] software node: Implement device_get_match_data fwnode
 callback
Message-ID: <ZnfVoQmCE-wJbIYU@google.com>
References: <20240427203650.582989-1-sui.jingfeng@linux.dev>
 <ZnXbaubPVAUdDIu0@google.com>
 <7b5305b6-78b0-4add-9e70-271159cfad95@linux.dev>
 <Zncl_O-NjMRZYGeA@google.com>
 <ee4e8724-4a19-4814-9b7e-9eb6eb0ac6a3@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee4e8724-4a19-4814-9b7e-9eb6eb0ac6a3@linux.dev>
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

On Sun, Jun 23, 2024 at 03:38:23PM +0800, Sui Jingfeng wrote:
> Hi,
> 
> On 6/23/24 03:29, Dmitry Torokhov wrote:
> > > In case of non-OF match (which
> > > > includes the case where you use software nodes) the match data is coming
> > > > from matching spi_device_id entry in the driver.
> > > 
> > > We don't care about much how it is probed now, rather, after the driver
> > > probed by a non-OF way, how does the additional devices properties
> > > can be get?
> > > 
> > > 
> > > Say:
> > > 
> > > 1) "device_property_read_u32(dev, "rotation", &rotation);" and
> > > 2) "!device_property_read_string(dev, "pervasive,thermal-zone",
> > > &thermal_zone))"
> > > 
> > > 
> > > For those spi/i2c/platform devices, what we argues are that
> > > those drivers really should just depend on "OF" before we have
> > > a reliable fwnode API backend to redirect to.
> > They are working fine without such restriction now,
> 
> 
> You still *NOT* answer where the additional devices properties[1][2]
> can be acquire.
> 
> [1] device_property_read_u32(dev, "rotation", &rotation)
> 
> [2] device_property_read_string(dev, "pervasive,thermal-zone",
> &thermal_zone))
> 
> 
> > so I see absolutely no reason imposing this restriction.
> 
> The reason is rigorous.
> 
> You are acclaiming that works by hardcode or by ignoring the flaws
> is fine, then all driver are working fine by *your* standard.
> 
> Your personal standard has nothing to do with this patch.
> 
> > > Where the additional device_property_read_xxxx() calls redirect to?
> > > 
> > > What if users want to invoke more device_property_read_xxxx() function?
> > They are being directed to first the primary FW node instance, which may
> > be either OF, ACPI, or SW node, and then, if property is not present
> > there, to the secondary FW node, which can be either again.
> 
> 
> What I'm asking is, on the non-OF and no-ACPI cases, where's those
> device_property_read_xxx() calls can be directed to?
> 
> > At no point ->device_get_match_data() callback in involved in this
> > process.
> > 
> 
> The patch is written for people who need it, not for people who don't.
> 
> It will be involved if the device is associated with software node.
> Its for fwnode API user to get a consistent experience, that is
> to get a matching data without introduce extra/duplicated match
> mechanism.
> 
> The patch is focus on fixing the undefined behavior, is discussing
> the correct way to consolidate the fwnode API. Its not going to
> discuss how does the those *old" and/or how does those non-fwnode
> systems works.
> 
> Its NOT discussing how does the driver itself can be probed, a driver
> can be probed multiple way and is another question. Being probed and
> extract matching data can two different thing and is perfectly valid.
> 
> Your problem is that you are not fully understand what other people
> does before you rush into the discussion. You are putting restrictions
> onto other people, while leaving the problem itself there unsolved.
> 
> Its not a place to express your personal value or you personal status,
> such as, you are "ready" or "not ready" for something. Or persuading
> somebody should get used to what or teaching people to talks with a
> whatever tone like a God.
> 
> None of those junk words are technical, I can not see constructive
> ideas.

Yes, indeed, it appears that further discussion is pointless at this
point.

Andy, Heikki, Greg, and others: FWIW this is a NAK from me.

Thanks.

-- 
Dmitry
