Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7EB7B4BB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 23:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF146E615;
	Tue, 30 Jul 2019 21:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A27A6E615
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 21:04:48 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id g17so67246792wrr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 14:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iEv6uLN5Ie8RNnqsKAj/DNXIgIUVt0q6Jt18r71legI=;
 b=SgpbjyypoeSUWU5QjxOAV4NDUOkJ5qrQ4m/23NLzWr3HqP0HFeCmnDPIxW/wekwNDf
 Eea1ApRHqajN6CsbLdT0pc1xmQQ7NWcqxDM7B8ogig6jyQlam7FLroB0dXgXEI01tyOs
 o2pDxa8n600uPmmMz3tEE4g5ffKZAlfRcAhzhwxgnjaAa5AO0dkVX9umoiRVH/QdW7Fs
 QuWYcH8yOyb38rzE6f87P6fpg8SQK20phiF9hXUw57tBic6K0D39N3vKRc+YP8o6gNyD
 7EL3/n5phuJzu5jcCCVCIokAMtL9qCGhpM7eOsGISJFm842saBf/Y3CSpNxVjRGmEYnA
 vM0g==
X-Gm-Message-State: APjAAAVls9kGmNFInxhZb08ehRfxfzK8pcPqMDBorPI7T5VFbOqf351b
 hVsUi1GzHz4ryfE+dA+tXHcrDTDY
X-Google-Smtp-Source: APXvYqy9khy1EPoanloRxyl/Md6DChJwMhLfdto1dlhrTXkaPJMk0EOyHVh0bZnK9s4V8zhAGvPpiQ==
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr40219198wrp.203.1564520686802; 
 Tue, 30 Jul 2019 14:04:46 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id p3sm54096546wmg.15.2019.07.30.14.04.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 14:04:46 -0700 (PDT)
Date: Tue, 30 Jul 2019 21:04:04 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@freedesktop.org
Subject: Re: [Bug 110575] [R9 380X] Artifacts in CSGO
Message-ID: <20190730210404.GA871@freedom>
References: <bug-110575-502@http.bugs.freedesktop.org/>
 <bug-110575-502-nH4PTorwrK@http.bugs.freedesktop.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-110575-502-nH4PTorwrK@http.bugs.freedesktop.org/>
User-Agent: Mutt/ (2018-04-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iEv6uLN5Ie8RNnqsKAj/DNXIgIUVt0q6Jt18r71legI=;
 b=AXt9scWhFCpvKEBN5JEew/FMEUFu1wqRLHv/t1+r5sRLuVbVswdVZnuZ5oK/nbzC3V
 D9JbRVav3RIfVjpJTvJDXHV6Pz7/+sQZ/mX2KJ/2GmwsmimjhKKVRH7TamQfEL+XEakU
 xZCR+PN+ZklG1i6pIWRUYycu2MGfereYzNeOiM0Jd5lOsjbnxuaElXZXuewEm068OOCG
 uaUhW24B9vC1EXxd/nlk7rbhijHschH/GOdt4SD3SjIYfUEFDD9BpNlI4wFyJ/zi3o9z
 BgF2+bZIypX/A7PJ0wthbeq3tWfjdJ7A88Kg6VUEc56C45zfuzS30ms637XTESy4BV1X
 QmmQ==
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

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDg6NTQ6NDRQTSArMDAwMCwgYnVnemlsbGEtZGFlbW9u
QGZyZWVkZXNrdG9wLm9yZyB3cm90ZToKPiBJIHBsYW4gdG8gZGlzYWJsZSBTRE1BIGltYWdlIGNv
cGllcyBieSBkZWZhdWx0IG9uIGRHUFVzLgoKSXMgdGhlcmUgYSBwbGFuIHRvICJzdGFuZGFyZGl6
ZSIgdGlsaW5nIGZvcm1hdCBvZiBmcmFtZSBidWZmZXI/Cih0byBkbWEgdGhlIHJpZ2h0IGZvcm1h
dCBwcm9wZXJseSBmcm9tIG9uZSBicmFuZCBvZiBncHVzIHRvIGFub3RoZXIpCgotLSAKU3lsdmFp
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
