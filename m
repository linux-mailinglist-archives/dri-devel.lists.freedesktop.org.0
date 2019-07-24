Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D92E7324C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 16:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4B56E5C2;
	Wed, 24 Jul 2019 14:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC4D6E5C2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 14:56:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id v15so42153132wml.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 07:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yVZD9l4Gvxq9wJJN0TZU22FcPfwvUUgTwtcDconbwWI=;
 b=NaAz3GSrJ+wAyiXXceRxxrv1m8XrKGB6GhVyThYFRAR8F62gBVV5/Z45WX8edBlREr
 GfzHf0oTG54fCl3mtJ/Tn3zGBV2FFSxvno4rGAvzRPV6+yegXoO1VayYUNwSsBJkDsNF
 szfNCIrcFQ0yGLFXpIM/FOnvTeRQ1/s/pcRSjS/T9TeMle9CNSxJswbJE+vKZf3pOLPU
 hOA0pLSu1EYLVyZddh5nn5KQf6CkbDM0WJmos28m98an7hjdpkJ9zXauGaKnlM1TC+oE
 KidwsOP7hICv3B6ze4lIBYA4AbdSDw+aHpkpAp3w7ZOpB2+At0kqksapI+ZZPm2W9Vpi
 kVpQ==
X-Gm-Message-State: APjAAAUtsC4BhrXdhXo1Gy1BAoQJ3hg8DtywQ5WljuSgZYzuxFBrkQ8t
 kxgRR7EvCb5kZ96g3d2l9os=
X-Google-Smtp-Source: APXvYqzon3iKGKFipR/+xfCbRcfN3AOM31aDxi+nUqs6bXNlvNJFrOdKXQvHnfyhitEUPfT3ACBhJQ==
X-Received: by 2002:a1c:c706:: with SMTP id x6mr73361235wmf.162.1563980179126; 
 Wed, 24 Jul 2019 07:56:19 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id g8sm44846799wmf.17.2019.07.24.07.56.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 07:56:18 -0700 (PDT)
Date: Wed, 24 Jul 2019 14:55:53 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@freedesktop.org
Subject: Re: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Message-ID: <20190724145553.GA786@freedom>
References: <bug-109955-502@http.bugs.freedesktop.org/>
 <bug-109955-502-iPRcNArMi1@http.bugs.freedesktop.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-109955-502-iPRcNArMi1@http.bugs.freedesktop.org/>
User-Agent: Mutt/ (2018-04-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yVZD9l4Gvxq9wJJN0TZU22FcPfwvUUgTwtcDconbwWI=;
 b=VYlG4LVItWAvb/ZK7Umj8eIZ4mUIhtOvltDUFlnXugegtoON72aPk4S65WzXOU9Vn9
 SDMBX8vUXm8XM0V7ssZNLj5PwDMGRuDDcGZn2I4HjpwSzviDsuu21f0T3eSEeN0rKA5r
 zom8meD9jkNXTiYGzu26Adr6k8f9EN7R6leYX8u6O3PtLE+Fd9KOso0Knm3R1ydTIfHP
 f7cFrnapdFEl56LVSm/z8Zg8R5npcx3Cu/nzSOyNmc1OBgiCLr7k0S3cTfMERmYEG+/L
 gvbZneRTbtfyFtzSa/kNpTSm8rVl/I7KnzO8vOEPOCYZ+MNtgVJ87cSVmDSv5dGm+5C1
 kdVw==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAuLi4KPiBWdWxrYW4vRFhWSwoKVGhlIGJ1Z3MgbWF5IGJlIGluIHdpbmUvRFhWSyB0aGVuLiBZ
b3Ugc2hvdWxkIHJlcG9ydCB0byBhIGJ1ZyB0byB0aGVtIGFuZCBsaW5rCnRoaXMgYnVnIHRvIHRo
ZWlycy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
