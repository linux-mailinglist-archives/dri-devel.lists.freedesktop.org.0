Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E4674E0B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 14:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C274A6E72F;
	Thu, 25 Jul 2019 12:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B7E6E72F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 12:19:16 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id d4so50073857edr.13
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 05:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xdFmPAzzMG4KY9mmUEhgGQEN//m1+EEx/F89QPyNn70=;
 b=Hgm3qcTHW7jTXWtZwTk8owUEDoBhET4bqOAyP+GDoVPZLIXMT/48736KiW3m3+ZtTF
 qqan98Dte2xmFw5jGsMfEX/Zz+6MDwXwnuncPi7DGrXvUDe3ezqLiYCJi1eOJjtTnWbP
 GH0hb9YEI6t4BPZ6NOl5SHX/vW5wUCRPnz4ys4rf8WEX5yt7rQUVg71WOeEaSYabRDr6
 1R5ZMVNOxq+shA0Qu7CbUxtB5RIfrhzWWhnCnT+AnNGI5Bn1dy6H99KBtpCTS7Hi8e7f
 CaAL2x3CMkQNEMi583L3ltExhxeOHvoOuZkiU6kpUk590dalfoT9z6ONBDl/8uCUZuF4
 MZUw==
X-Gm-Message-State: APjAAAWxEia31K7+pFl9vGLeX2bf7qr6QFPsVp1Uq/35rEhUCsBUe/6K
 lZTHA6CqI/8htFe/1EcbicU=
X-Google-Smtp-Source: APXvYqz8DEteKGoU5ugmt9u5kQGNA2F7+GlLqvUQvY7wyl034g6JxCA1RjQI99X+pDELNJivxzSl9A==
X-Received: by 2002:a50:9153:: with SMTP id f19mr77868094eda.70.1564057154651; 
 Thu, 25 Jul 2019 05:19:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id br13sm9733732ejb.92.2019.07.25.05.19.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 05:19:13 -0700 (PDT)
Date: Thu, 25 Jul 2019 14:19:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
Subject: Re: Recall: [PATCH libdrm] libdrm: wrap new flexible syncobj query
 interface v2
Message-ID: <20190725121911.GE15868@phenom.ffwll.local>
References: <MN2PR12MB291065C9FF1CA9963C7569BFB4C10@MN2PR12MB2910.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MN2PR12MB291065C9FF1CA9963C7569BFB4C10@MN2PR12MB2910.namprd12.prod.outlook.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xdFmPAzzMG4KY9mmUEhgGQEN//m1+EEx/F89QPyNn70=;
 b=BdLx2/OQZL5oRkDKhZtLOPTG+jANrNV1zQOjLMUEvr/exhwwP1GNAZTgB+mSvtf4uJ
 CbXZUbfcbc848xLmQcWD+goc7B0qavN0uGfIpBiOWE0TVPOn5g5x45N8bCiK79rCTCzj
 Tr8OudKOEuAj60a+7+WH1jtu1ptZN/HcBPZzw=
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDg6MzQ6MzlBTSArMDAwMCwgWmhvdSwgRGF2aWQoQ2h1
bk1pbmcpIHdyb3RlOgo+IFpob3UsIERhdmlkKENodW5NaW5nKSB3b3VsZCBsaWtlIHRvIHJlY2Fs
bCB0aGUgbWVzc2FnZSwgIltQQVRDSCBsaWJkcm1dIGxpYmRybTogd3JhcCBuZXcgZmxleGlibGUg
c3luY29iaiBxdWVyeSBpbnRlcmZhY2UgdjIiLgoKVGhpcyBidXR0b24gZG9lc24ndCB3b3JrIDot
KQotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
