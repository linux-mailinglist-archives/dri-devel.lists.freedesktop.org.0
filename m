Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE9F639BE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 18:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96026E083;
	Tue,  9 Jul 2019 16:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4F96E083
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 16:58:12 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id u19so44644713ior.9
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 09:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=90nKBwxJQfOO8f1bbVdhzZRUgzRJZ25Z+zIv0ysWNrA=;
 b=cEbmKviW5cQYobiNWzw4A4insK2L7ZZByazVoEH/Ghc3DkwxLK+IRSNlVIQiVHl9MB
 I5RoQ6+165nvbR86EYTp/uqt48eauDBs57/worp5kZLGHJszMaVx7rHybey54HlI6Tbw
 7TAGNp9bmnvAb5gTpyvbYW4MpRwkn8ObLY7GzhHP8BtGNXeMd5a9RNkx1J25JO+RdHm+
 QWT5PoFVgSrFnNQc2/2nXK1/k5aKTF1pyHAAYvTf7MG8fjQC4VikLRT+7/+PI2/7se5F
 PhdU9GH10i6HlMEk2hYmEz92T7We9O7i8ddaqg49Pu6FIwffMZD50sXsM3GtEgGlltoB
 aMRA==
X-Gm-Message-State: APjAAAWNVJkUS1nlGsan8iLeSOxbBo6qGWCR7+lrfHc5xKi2tD6jm1S7
 /qV39eXHaXbbppYNEbceLw==
X-Google-Smtp-Source: APXvYqyzqY3fUqgHOKs5xetSi+syYPXpwYIQobtQET9nlWhHXWw2xMA2YyTM5BzJRhVfTcO9zAYeGA==
X-Received: by 2002:a5e:d80d:: with SMTP id l13mr7589708iok.292.1562691492115; 
 Tue, 09 Jul 2019 09:58:12 -0700 (PDT)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id e188sm18470483ioa.3.2019.07.09.09.58.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 09:58:11 -0700 (PDT)
Date: Tue, 9 Jul 2019 10:58:09 -0600
From: Rob Herring <robh@kernel.org>
To: Marko Kohtala <marko.kohtala@okoko.fi>
Subject: Re: [PATCH 5/6] dt-bindings: display: ssd1307fb: Add initialization
 properties
Message-ID: <20190709165809.GA5401@bogus>
References: <20190618074111.9309-1-marko.kohtala@okoko.fi>
 <20190618074111.9309-6-marko.kohtala@okoko.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618074111.9309-6-marko.kohtala@okoko.fi>
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
 linux-fbdev@vger.kernel.org,
 Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Marko Kohtala <marko.kohtala@okoko.fi>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxOCBKdW4gMjAxOSAxMDo0MToxMCArMDMwMCwgTWFya28gS29odGFsYSB3cm90ZToK
PiBEb2N1bWVudCBuZXcgYmluZGluZ3MgZm9yIGFkYXB0aW5nIHNzZDEzMDdmYiBkcml2ZXIgdG8g
bmV3IGRpc3BsYXlzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmtvIEtvaHRhbGEgPG1hcmtvLmtv
aHRhbGFAb2tva28uZmk+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
c3NkMTMwN2ZiLnR4dCAgICAgICAgICB8IDEwICsrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKykKPiAKClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
