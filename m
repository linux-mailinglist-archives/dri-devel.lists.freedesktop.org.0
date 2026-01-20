Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCz5L/Xdb2n8RwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 20:56:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531C24ADE3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 20:56:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A307410E17A;
	Tue, 20 Jan 2026 19:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O0xu7LW3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4200C10E23A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 19:56:34 +0000 (UTC)
Received: by mail-dl1-f42.google.com with SMTP id
 a92af1059eb24-12332910300so9199766c88.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 11:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768938993; x=1769543793; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lPDgUMFRl+w+AbB4KcmndfGR0As68bgylKNbbH3AGMk=;
 b=O0xu7LW36tc0hWFEe4U6u5vpdh7T0CHWTsYGNdnyU2tEjUNKlsE7ohVsll56MSqyfo
 btPV7Vz3+/uhxE6dUM2xAdqhjlbBwSIDHt5s5WRGAXE0yGgyvZ6tfh2cg+IXn/D5Qw8/
 WOCRiAJdGxPbYddLIFIF6Z0oIayN6SRrCWVPdW0NS3UBfneQB2eG3kUltebhyETI6HTt
 L7Txse76MwSBuaYYIbQreGAFhtumELOTHI1h1W/CV5hkzUWU0JNs6/GEEbFmF3r0iYdA
 2UKQ21ML7jS1k8QjSuU1MtFAzn51VaUfrKlKo02FYP6Jtmzi+eX6755qmpuF5KX9Qiwv
 3Row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768938993; x=1769543793;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lPDgUMFRl+w+AbB4KcmndfGR0As68bgylKNbbH3AGMk=;
 b=wHPBuRdaNk2mJbqIv8C9A4hF41keYRPffJpZOVCbs9RtuK57q4jvedcLSaXU1k0l0i
 HQpQq8zEgenlepzDXrTWtze1f9AfE7aEp3x5GnVZpVIacEgQ304SRs1PIwSOUJwKco/j
 lLhZrhFcriCSDNOH551rZWyq1y8OQA6/DGav8GwhYTFyxRNwz/e9q4xBicTkVVCVnyX3
 C8zDHLr8qYdJxbspR7bKDz9oc740mJkf3ivyngF7c1WR3pTZlQcS4ZcR5rS56qQ2QVwg
 rhYxOxKyl+FiJXW/Hh/8FcsPdm7cT8st8vkH4nB/+d1YLAhXmQI+PruPKNy6MUXGx4ER
 4I5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE+av1o8/5Ih+A7gpBODaW2vmr2V2J6KNBrGm2YJAXoE6yeIJkzjid4EMJso9nsPUSu20Q8MvYfgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBssLIJ3+d/rTRxTNA8Bkq5KwJ2OjsHDBHB60IQ5ifCQ2GfqGS
 kBikxRLaq7VEnxSaWSEZybGy+9yNMxkCKRCyWYXs1Us6HYrwFPVzadu8
X-Gm-Gg: AY/fxX7MNL4x0adPhryzoBKZn3ECG/DsvFa7xeLYmQcbpOzhVHREde7d9cfOyGySP6w
 Q8c7l8MvIp8tKVYIJM4v6bw4TKZS6PDKG1htKCsrYJTC/U48u72ETHp145tcxhTZRWpDn7BLtj6
 x1VW/K/B1jXF/dU9BGctknSbiVRLJbscRdgjCaq8I0OZ/njoZdea2xWbZjrzm6UjLQ8rs2cYJkN
 JlH2vUj1SfjKlt0wXfkNT4ETpF1CiS7drqKINpoQTI09UyXp8aPlpx76PJxK+Nmuez+RVulHtje
 EUSUy8Vd8vwySYKedi7c9uc5hwIQDmZa1lekM1iEWD3+34gOjgpqJFbhtOydX00/tG4YAZAVsQc
 dCKfzEN/WvKRy+AHS6ujdlG3Uy3CyaNEATwulXejSksIqQOkLVk0Pes2vNKuelRNEczijwO+u0X
 Bz/BlV08EBpk0Fwy1EuSQItrqtUnHlremvVvVb1kDS1rHydAEZ94SB
X-Received: by 2002:a05:7022:608b:b0:11e:3e9:3e8a with SMTP id
 a92af1059eb24-1244a7910d8mr14869120c88.49.1768938993269; 
 Tue, 20 Jan 2026 11:56:33 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d631:e554:f0bd:4106])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1244ad740c5sm23388705c88.8.2026.01.20.11.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 11:56:32 -0800 (PST)
Date: Tue, 20 Jan 2026 11:56:29 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, sre@kernel.org, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, 
 lgirdwood@gmail.com, broonie@kernel.org, jserv@ccns.ncku.edu.tw,
 eleanor15x@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 3/6] dt-bindings: input:
 google,goldfish-events-keypad: Convert to DT schema
Message-ID: <nab4yksjgk7jbofm5fkrafuz5c3dmi2oocdzgoscfj6ua7zwfh@olnrxt7sa3qp>
References: <20260113092602.3197681-1-visitorckw@gmail.com>
 <20260113092602.3197681-4-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113092602.3197681-4-visitorckw@gmail.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:visitorckw@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sre@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:jserv@ccns.ncku.edu.tw,m:eleanor15x@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-sound@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,linuxfoundation.org,ccns.ncku.edu.tw,lists.freedesktop.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 531C24ADE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 13, 2026 at 09:25:59AM +0000, Kuan-Wei Chiu wrote:
> Convert the Android Goldfish Events Keypad binding to DT schema format.
> Move the file to the input directory to match the subsystem.
> Update the example node name to 'keypad' to comply with generic node
> naming standards.
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Applied, thank you.

-- 
Dmitry
