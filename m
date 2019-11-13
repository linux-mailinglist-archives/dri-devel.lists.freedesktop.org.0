Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2521FA729
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 04:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEBD6E059;
	Wed, 13 Nov 2019 03:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271AB6E059
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 03:21:30 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 94so370387oty.8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 19:21:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=SzJrfGGjB/WLv221edrkrOTRzZzVy8yKLGHtpQA1XPc=;
 b=MT2G9ZLHN95gckO82sPwWHR2kSJV6n3TGlKU+XNCI+GLR1ENqSF15rKQ9a/tBbM3LM
 A2dTZJdLNMmRdvTOaOe/01q90j/o75MMrCJZ7XsztnmzLSHsdUThJhrGF778yU6kQynN
 kjFyi//Ku7fUwFwTyhvfksTMlRcNoaoTIHja9wtyHTsPx3y0eRrrbjtD0k6Vrf0eukUu
 JmHxQC3MAemqmsNoSS3Byb2s+lDpEhT5lXU72oVR20TZ9YNY/8hynFoKkN/5fePXb27A
 BdH5plAadXWHxWpaSdmvBLSx8XxW4lG+o7iC5OSxiNGToTbpHkrjCVSzOAG5OMF5uQxl
 XS7g==
X-Gm-Message-State: APjAAAXVW0v72cq+4XGtkPO9I9PjWvl/S8YTQS1DZcneFpWEJ1I5npSr
 Om3GtEOrwySyNR8cxzAhZw==
X-Google-Smtp-Source: APXvYqxePFSjd3TPVcaMub6kCODscfnVp2jQ/QDnl5E6kgpZHVmKfROkqP1E0ItBV2IEVA4XTPGwxw==
X-Received: by 2002:a05:6830:1f12:: with SMTP id
 u18mr897283otg.58.1573615288583; 
 Tue, 12 Nov 2019 19:21:28 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m14sm315678otq.6.2019.11.12.19.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 19:21:28 -0800 (PST)
Date: Tue, 12 Nov 2019 21:21:27 -0600
From: Rob Herring <robh@kernel.org>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 7/7] dt-bindings: gpu: arm-bifrost: Add Realtek RTD1619
Message-ID: <20191113032127.GA22397@bogus>
References: <20191104013932.22505-1-afaerber@suse.de>
 <20191104013932.22505-8-afaerber@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191104013932.22505-8-afaerber@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-realtek-soc@lists.infradead.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAgNCBOb3YgMjAxOSAwMjozOTozMiArMDEwMCwgPT9VVEYtOD9xP0FuZHJlYXM9MjBG
PUMzPUE0cmJlcj89IHdyb3RlOgo+IERlZmluZSBhIGNvbXBhdGlibGUgc3RyaW5nIGZvciBSZWFs
dGVrIFJURDE2MTkgU29DIGZhbWlseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIEbDpHJi
ZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9ncHUvYXJtLG1hbGktYmlmcm9zdC55YW1sIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+IAoKQXBwbGllZCwgdGhhbmtzLgoKUm9iCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
