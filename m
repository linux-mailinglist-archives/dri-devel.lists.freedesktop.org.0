Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89882C0DF5
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 00:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4A06E29D;
	Fri, 27 Sep 2019 22:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2077F6E28B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 22:20:40 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id k20so6530136oih.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 15:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zSlrRQAyUzLzDePKx5F/JeUlPrFE0AHowrB2Uv3bJB8=;
 b=GUZ/foxGn5fUWXlRtE3Qsh0G9+xfkEBqCnSX6BGeu7xxxKDeJ30O/c971Xv67CjoVk
 QNH0M2bQ+BbOrPmVRRnRvh2hq0nvFuFeIFedvLqNVZLihDfU3RXhhsdLxX73TPUP8EyT
 T1h3TpgW/WT71KjYELSlaPVWGo9aO8Dz5F8/3/SZdJZ1NnrmWZyDy6IXwjtoA7EVqdv6
 2E0HpNOlINyVO4sAJBX5KFJErK7Jlm3LtSodB/HvNr8nkdGPdbAfktWakJ7EtgdnPB+w
 HcH0l/btfKGrwslBir+df4GuK5Y1xwIOroxd6/NEHxOtM2a9G4pO/9NHxRKTHsH71hJR
 0CAA==
X-Gm-Message-State: APjAAAVkMKId7aULR3bXlJkVFjnTWubrosFhpRaVlH/pdDuwe+HtQpfj
 K/I536yyLcLaF+sjy73prw==
X-Google-Smtp-Source: APXvYqzLqhBEtloMUt2UFKRqZAEv8FDUTvUeMoLWCYalfih52zLOnd74yMfYEgyPVlzzI7KvIsbC/Q==
X-Received: by 2002:aca:c3d0:: with SMTP id t199mr8571497oif.22.1569622839198; 
 Fri, 27 Sep 2019 15:20:39 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 5sm1388319otp.20.2019.09.27.15.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 15:20:38 -0700 (PDT)
Date: Fri, 27 Sep 2019 17:20:38 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: Document the Xylon LogiCVC
 display controller
Message-ID: <20190927222038.GA22180@bogus>
References: <20190927100738.1863563-1-paul.kocialkowski@bootlin.com>
 <20190927100738.1863563-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927100738.1863563-2-paul.kocialkowski@bootlin.com>
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTI6MDc6MzdQTSArMDIwMCwgUGF1bCBLb2NpYWxrb3dz
a2kgd3JvdGU6Cj4gVGhlIFh5bG9uIExvZ2lDVkMgaXMgYSBkaXNwbGF5IGNvbnRyb2xsZXIgaW1w
bGVtZW50ZWQgYXMgcHJvZ3JhbW1hYmxlCj4gbG9naWMgaW4gWGlsaW54IEZQR0FzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFBhdWwgS29jaWFsa293c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBib290bGlu
LmNvbT4KPiAtLS0KPiAgLi4uL2Rpc3BsYXkveHlsb24sbG9naWN2Yy1kaXNwbGF5LnlhbWwgICAg
ICAgIHwgMzEzICsrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzEzIGluc2Vy
dGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3h5bG9uLGxvZ2ljdmMtZGlzcGxheS55YW1sCgpBbnkgcmVzcG9uc2Ug
dG8gbXkgbGFzdCBtYWlsIG9uIHYxPwoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
