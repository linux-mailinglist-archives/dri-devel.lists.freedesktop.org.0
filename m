Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E6782CA5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B400A89EBD;
	Tue,  6 Aug 2019 07:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484AB6E2E3;
 Tue,  6 Aug 2019 01:20:33 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id u14so40557132pfn.2;
 Mon, 05 Aug 2019 18:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mtYMlQz5eR4+kIe+tAhZIY/OAiGfRw2YuZyhkg6PTbo=;
 b=Ee9QGubi7L/1rfL3L9bU2rFV18lMab8tbD+rnO9BpUtexVmZ950vKasEMkA7uQ2Ls2
 ianw7gu6LmIycZe4rE+OqXCnLI3jDywtJh1b9LiPdwrZfnJx3V7I+t5nZDSurXzkOTaP
 gcfb++9i+5bCvRFNOZK/wxP/l0+RYdl7DU7oBaInZEuU6glcagGcWBY5UJd2Uioo4xKj
 N9eThDmVXrkG0ZFjLqKclKO2g2/URtp27cERfN5+L9F9hElnoYSyAgA/TP0Th3Qm6cYr
 2xVbRxsK62DAkcPjN4OgxJc2xnYnahlXr3lTFp2p8lilG3eLIEwMJaYF8cELQP9su5KC
 UiJg==
X-Gm-Message-State: APjAAAXs96KEW7WzCAgW8tlk8Ds/NZz4f01CkG8uaMgAsCWjsVobVd+M
 Ujk+45mZldcxiCu+3TB3gQ8=
X-Google-Smtp-Source: APXvYqyk8tVOqj3JMVpCjtlfaOGnmhUXY3kE6uE0j7jKcIcNic1rF0xLGvreX1yB+YVxBYd2ICFGvQ==
X-Received: by 2002:a62:63c7:: with SMTP id x190mr842306pfb.181.1565054432856; 
 Mon, 05 Aug 2019 18:20:32 -0700 (PDT)
Received: from localhost ([175.223.3.169])
 by smtp.gmail.com with ESMTPSA id b3sm101609286pfp.65.2019.08.05.18.20.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 18:20:31 -0700 (PDT)
Date: Tue, 6 Aug 2019 10:20:27 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCHv2 2/3] i915: convert to new mount API
Message-ID: <20190806012027.GA6149@jagdpanzerIV>
References: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
 <20190805160307.5418-3-sergey.senozhatsky@gmail.com>
 <20190805181255.GH1131@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805181255.GH1131@ZenIV.linux.org.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mtYMlQz5eR4+kIe+tAhZIY/OAiGfRw2YuZyhkg6PTbo=;
 b=I4hS4PEoJyvL+rw1aye+bkuNyFTmZHeIiI7RFxBXJ0CuNP49MtEx6c4dDp0dM/tsx/
 htvzfDxZ5r+0xq/giBKycsgk0ooQTnliw8jAdM/W7Q3ZOPIXKO2qQyyIEZllNw9fCaCK
 AFdoMHbbELxkIctqol+apII3pU0v0VXRJ+BZTJNcArgxrMpmPImidiNKJGa2PwyGiGNv
 o8knT7XYXIG+Goz56jLAprXlNR6Ro/Kzov23naZj39nZRkay4wQSSRKGepoZcGaR4LWM
 AS12+SoRSLzpL24lbVcgQ/5ahDrIgIt89rGuB5PPO3/lXQeKGmqNafdrVjeefbqsXOSG
 JgRg==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gKDA4LzA1LzE5IDE5OjEyKSwgQWwgVmlybyB3cm90ZToKWy4uXQo+IE9uIFR1ZSwgQXVnIDA2
LCAyMDE5IGF0IDAxOjAzOjA2QU0gKzA5MDAsIFNlcmdleSBTZW5vemhhdHNreSB3cm90ZToKPiA+
IHRtcGZzIGRvZXMgbm90IHNldCAtPnJlbW91bnRfZnMoKSBhbnltb3JlIGFuZCBpdHMgdXNlcnMg
bmVlZAo+ID4gdG8gYmUgY29udmVydGVkIHRvIG5ldyBtb3VudCBBUEkuCj4gCj4gQ291bGQgeW91
IGV4cGxhaW4gd2h5IHRoZSBkZXZpbCBkbyB5b3UgYm90aGVyIHdpdGggcmVtb3VudCBhdCBhbGw/
CgpJIHdvdWxkIHJlZGlyZWN0IHRoaXMgcXVlc3Rpb24gdG8gaTkxNSBkZXZlbG9wZXJzLiBBcyBm
YXIgYXMgSSBrbm93Cmk5MTUgcGVyZm9ybWFuY2Ugc3VmZmVycyB3aXRoIGh1Z2UgcGFnZXMgZW5h
YmxlZC4KCj4gV2h5IG5vdCBwYXNzIHRoZSByaWdodCBvcHRpb25zIHdoZW4gbW91bnRpbmcgdGhl
IGRhbW4gdGhpbmc/Cgp2ZnNfa2Vybl9tb3VudCgpPyBJdCBzdGlsbCByZXF1aXJlcyBzdHJ1Y3Qg
ZmlsZV9zeXN0ZW1fdHlwZSwgd2hpY2gKd2UgbmVlZCB0byBnZXQgYW5kIHB1dC4KCgktc3MKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
