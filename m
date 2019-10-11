Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE41D4368
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 16:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508D06E0C8;
	Fri, 11 Oct 2019 14:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1682B6E0C8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 14:50:44 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id k20so8221151oih.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 07:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=gryLhIXL4l6QqVF4jY3/Zduxk2LABaCpupxRbGKjliY=;
 b=jnsY/K5K9g5Oo83LicfvdFs71hK9Ll04NwR5ir13fehhnBS3/Z5n8JBdHhLVoCCSSr
 q8oyZX20buwoK+jWUtSYzzrcxxMkd58/DHkCAFPYFQLXumq8i2m+OZ5v8w9MrQHo9wb4
 8rmSJFWNRXzPyhIak/GGVwed+AXXbqAZsYR2+sQ0aJjcEHR+R1CSHmnq4zjSzOPXR7eN
 N9NFaBFyGcPc6nAydGL0zfV8n/jYEIj8tJGjdSyQdiwGtloGFNqApu70YZk3/63f8B9r
 l/12SKj+i+LfRXXb1+FAm7tOsq6enEYYcsXoD+gO6cmGiE0a6W+U47h2T3Xv9caUXqWO
 3/9g==
X-Gm-Message-State: APjAAAXAJANGLC98SuYpa79qfs+HrYbKEGW4++uOKp6iLPpeKuYZq9ot
 4t0yHjP3ZzUkUA6nxpJ5bA==
X-Google-Smtp-Source: APXvYqw4tg27DOTO+ilupZjHUfUpz2Sf7rFACQOxDJK44IZFRl4/ElfBF+Wwbk3Nyc8kNUvRcmX/Yg==
X-Received: by 2002:aca:abd2:: with SMTP id
 u201mr12259123oie.105.1570805443172; 
 Fri, 11 Oct 2019 07:50:43 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v7sm1182819oic.9.2019.10.11.07.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 07:50:42 -0700 (PDT)
Date: Fri, 11 Oct 2019 09:50:42 -0500
From: Rob Herring <robh@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@nxp.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: display: imx: add bindings for DCSS
Message-ID: <20191011145042.GA15680@bogus>
References: <1570025100-5634-1-git-send-email-laurentiu.palcu@nxp.com>
 <1570025100-5634-5-git-send-email-laurentiu.palcu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570025100-5634-5-git-send-email-laurentiu.palcu@nxp.com>
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
Cc: devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>, agx@sigxcpu.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

OnU/d2M/P201P14/456+P300LT8/entiPz8/cj8rP9eAdT8/P9inPz8/PyMXPz8DPz9layA/Pz8/
P1c/Sj8/Pz9ePyg/Pz9ofT8/LT8/entiPz8/cj9aPz8/Pys/alcuPxpcP2/bindiPws/dispPz8/
P2x/PxpiPx8mPz8sPyY/P86+Pz8/Pz8/Pz8/Pz8/Pz8/P1c/Pz8hanged86iP8erPyonPz8reT9e
Pz9eP006Pz8/cumentatPz8/dT8/cT9reT/bindiPws/dispPz8/P2x/PxpiPx8mPz8sPyY/Pxc/
Pz8edT8/Pz/erj8/Pz8bP0c/Pz9oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
