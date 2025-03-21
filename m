Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB04A6BF20
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 17:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFEF10E7E8;
	Fri, 21 Mar 2025 16:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EWfjmuv0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9385510E7E8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 16:07:17 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7be8f28172dso150371085a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 09:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742573236; x=1743178036; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cXTmQzSNArG0LUnqvWiAWAFfFrIQ2vrTyW8gsvrq5lE=;
 b=EWfjmuv07OuhUX4XFNxR+cD4KB9v6U+yBSE6H8tnWJiRSlvAWkxVkKeKwaCyLMETAq
 vp87a79PKu759TBjK6Pk/MTAzzHbukxpMI8p4AXHLhbAz3ezMho5KoD+yDS1CVk0Gpmg
 ODXekLiYt64h6+TefvDxw+Cndgacf4J+O9DlZrykDrw/9HGYJ/vkpekS+x97kp5z1h5F
 3l4p7u01Tq37PJduHgeWS0ElteSsjkTa/kalkVXatTf8PhGOY/qJeMsCYjY69q7iXhMt
 xm8AgkEaJvW09w9iXRDN+AYDmf8jdDVMwVvyV+Onc2NOkOzh/saQTstVKdQwSyz9lSNo
 uXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742573236; x=1743178036;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cXTmQzSNArG0LUnqvWiAWAFfFrIQ2vrTyW8gsvrq5lE=;
 b=MvZPg0pvdXSu2G3o0fRpjzBsjRpZYCjltrq4BZZrk34dHb7TPKHeMLKmkHHimFD7V6
 xZjCSp/bh2ZXqPhoqvM+PEhEHxs+4SuOzq0cyV8RMHUxuJ0YQUiLaVNvnAXCsIRrwucz
 pmH3Goz0yOgbRUQfHLzclR3GgjIWCEbWMMzu+n9gzKcNlyBZv/SE9ujQ8atm9DsOKRSX
 ghlqba0l29bhYswD7nm7wAs9L5cns306z6Fq//Cm87ABjaDNKrhjXlGN8PsdguD7xRTo
 kgEMTewIB7MHqsef52xOXYrf3gemSScsrRvfSCpy7KBRCFHuE9c+RHS8dFceeN5tiveO
 Yp/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD3T1aiTmjYB9bhYA1GVcaS1GIXoQNntsgZjIDrplzHam6grxz/FPCteIL08M+yWqtXZoLO8m9sTo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyV1XnqZb1NImaMw/cyKdQOJKnVZ9ZjsaYrBMJGYXqfXsQNN4hZ
 aRsvRnjz/HGmkzsNXS683OwosGlgS8WT7o2yZfS1X8tZHmeQHXM/
X-Gm-Gg: ASbGncswXrK07Hhes7FbkkBILDJvEeoMr5rErALdPGRrnIaf62j/CWaggVUKe58ivvX
 S8qg+ZRq492X/jOvEtDufmyFMOevITlZ/4csAhfHGtC/Jq7evcaYEMlXiW+mkhdVHMf1Wq7zYwy
 ikQyNsOruuW4yc3fFoB0vyt+hFKrwz6myTskNqdy52RZNv02M2WYw03Y0TDFagrFcnT7KbWWvJR
 mOgnqNzcRMPMzvKLjpqHNss38wpQc6WqPg42vt/TrsEBCWCjnn3d5OlDuuhgCLHoo+a3KDeTQo7
 CimxyXSkUQtmslQSFV0obdr1eCCvP47Fa4+SxD2NGYUcpf3nJvPBQ1NshII68wIA+cmyDJh+AOD
 eQKq6Lg==
X-Google-Smtp-Source: AGHT+IE6wBkSae8r7jDv077Rr9iye2+iQLB7YCA3JeuoVSlKHZ/rpng//xmWpjmG3Q8Z0Byq3nUFNg==
X-Received: by 2002:ad4:5ca5:0:b0:6e6:684f:7f78 with SMTP id
 6a1803df08f44-6eb3f275bd6mr53792736d6.3.1742573236245; 
 Fri, 21 Mar 2025 09:07:16 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eb3ef0f214sm12600176d6.7.2025.03.21.09.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 09:07:15 -0700 (PDT)
Date: Fri, 21 Mar 2025 12:07:13 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Josef =?utf-8?B?THXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: Bug in mipi_dbi_hw_reset() causes incorrect DT entries
Message-ID: <dycrognvv7mlxdqmgkqx3bc2377zvrezvpj33pegqk5nhlayqr@5e2zckplhmof>
References: <v7krb2k3aybcpbzyx4ysjxpdpljpadk6xugpdsehzc6wp6aejw@53flicuphar4>
 <ebfdad9d-fe4b-41ac-b7df-eb7354dd9052@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebfdad9d-fe4b-41ac-b7df-eb7354dd9052@kernel.org>
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

On Sun, Mar 16, 2025 at 12:51:29PM +0100, Krzysztof Kozlowski wrote:
> On 15/03/2025 16:20, Alex Lanzano wrote:
> > Hi all,
> > 
> > There is a bug in the mipi_dbi_hw_reset() function that handles the
> > reset logic of the controller. Currently, it will set the reset gpio
> > value to 0, wait a specified time, then set the reset gpio value to 1.
> > 
> > The issue with this implementation is that the MIPI DBI spec states that
> > the reset signal is active low. So, in order to correct for this logic,
> > the developer needs to incorrectly define the reset gpio as active high
> > in the DT.
> 
> You should address it to driver and subsystem maintainers. Instead you
> skipped all maintainers but Cc-ed people who have nothing to do with
> MIPI DBI drivers in the kernel.
> 

My apologies. I wanted to get the advice from you and the other device
tree maintainers since I was proposing a new device property to address
this issue. CC'ing them on the thread now.

> > 
> > Fixing the logic in the driver would cause all the displays using this
> > driver downstream to stop working. To mitigate this, Josef and I were
> > thinking about adding an additional boolean property to the DT that when
> > present would use the correct reset logic in the driver. And if it's not
> > present use the current reset logic and print out a warning that this
> > reset logic is deprecated.
> > 
> > The overall plan would be to have this temporary fix for a few release
> > cycles so downstream has time to be aware of the issue and update their
> > DT. Eventually, we would remove the incorrect reset logic in the driver
> > and this addtional boolean property.
> 
> That's an ABI now, so you cannot change it without affecting users. Code
> is from 2018 so you have plenty of users now.
> 
> I did some workaround for wsa88xx speakers but that's an exception and
> it should not necessarily be a pattern to follow.
> 
> Not sure if it the issue is worth changing considering the impact.
> 

Makes sense, I'm just a bit concerned about the device tree definitions
not being compatible across different platforms.

Best regards,
Alex
