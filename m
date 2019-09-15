Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81447B308C
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2019 16:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7E66E065;
	Sun, 15 Sep 2019 14:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 384 seconds by postgrey-1.36 at gabe;
 Sun, 15 Sep 2019 14:39:10 UTC
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB3C6E065
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 14:39:10 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345--lKqfhQENyC_G_ZNURPkLQ-1; Sun, 15 Sep 2019 10:32:42 -0400
Received: by mail-ed1-f70.google.com with SMTP id 13so4874973edw.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 07:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=eG3mS3B2JDLBR5rQpCv0ggMB3rr1Zy0P5UovCn1qQgw=;
 b=n66WiGCbYns2LTnbM33T/JsW0XRhwZu0aR3zMQgbK4KnJrr9vwmAI+aaV9YsnhcyEA
 rtJ1/0DMpcgoFZnLhrqWe6GSefXT2FEdhlMoZvlrddL2FZkCtJtF87gE3V66DFufxYAA
 XLni5malCNzgO48ZLK2rBc3e958bUoUEM4MzjkEad6kwSg32jJckAaS+TUjVtqPdbsLk
 cG/iY1Nj1TZccAQ2NqALsRUXdpRmga5BrKolQojroTzG//IRZYRRxbzNMtRwgCFsfgY9
 g7cZ2dT0IOJQ073qJeF0y73rr/9zV4DktCtem/haQqig1qvDwEC3WNEz1VmZRG2NlM0e
 uqYw==
X-Gm-Message-State: APjAAAVuLm14k8xtLksvdbODC8Tt6s29t0v2E6GPnQ8CEnIpZ834hMBG
 4BncM884yBTJ5YcanH+t9ZWqg4theRWAgiCWN0a6bLSOO7+uHl6mUvKzJXk1l53/ANWSFEaeEdn
 KWJYEJ9wK0NI/YKVbx6mOIP9hQ/OY
X-Received: by 2002:a50:c209:: with SMTP id n9mr57612311edf.215.1568557961336; 
 Sun, 15 Sep 2019 07:32:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwEdJbdwSScRv2DkwCqBpkoLHtsdGP21ubf1xDJ7RZ2o+/6DX3Fk7FL27nIngXLl6gmmLQBRA==
X-Received: by 2002:a50:c209:: with SMTP id n9mr57612303edf.215.1568557961202; 
 Sun, 15 Sep 2019 07:32:41 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id l3sm3887439ejx.80.2019.09.15.07.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2019 07:32:40 -0700 (PDT)
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: Recent tinydrm -> tiny drm drivers rename causes kernel-doc problems
Message-ID: <d83a5434-00df-89cb-e0cf-3318fc12d3e8@redhat.com>
Date: Sun, 15 Sep 2019 16:32:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Language: en-US
X-MC-Unique: -lKqfhQENyC_G_ZNURPkLQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1568558349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eG3mS3B2JDLBR5rQpCv0ggMB3rr1Zy0P5UovCn1qQgw=;
 b=gS/WrXcd4lyaELxxyGHEER0BjB0W945ZTMkRZUQXLlkEaUyf1q1jwMte+d/6kSGaEdsdXg
 PYLfg4w57kTTjr9B8grEODef1GCvvUZGDMybRA0JDSQmWQ8bb+omTDPjOPd4BsftThVK67
 dd4fFupibYaKvQA1IDjIuOa6KDM/YgE=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLAoKV2hpbGUgZG9pbmcgYSAibWFrZSBodG1sZG9jcyIgSSBqdXN0IG5vdGljZWQg
dGhlIGZvbGxvd2luZyBlcnJvcnM6CgpFcnJvcjogQ2Fubm90IG9wZW4gZmlsZSAuL2RyaXZlcnMv
Z3B1L2RybS90aW55ZHJtL2NvcmUvdGlueWRybS1oZWxwZXJzLmMKRXJyb3I6IENhbm5vdCBvcGVu
IGZpbGUgLi9kcml2ZXJzL2dwdS9kcm0vdGlueWRybS9jb3JlL3Rpbnlkcm0taGVscGVycy5jCkVy
cm9yOiBDYW5ub3Qgb3BlbiBmaWxlIC4vZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vY29yZS90aW55
ZHJtLXBpcGUuYwpFcnJvcjogQ2Fubm90IG9wZW4gZmlsZSAuL2RyaXZlcnMvZ3B1L2RybS90aW55
ZHJtL2NvcmUvdGlueWRybS1waXBlLmMKRXJyb3I6IENhbm5vdCBvcGVuIGZpbGUgLi9kcml2ZXJz
L2dwdS9kcm0vdGlueWRybS9taXBpLWRiaS5jCkVycm9yOiBDYW5ub3Qgb3BlbiBmaWxlIC4vZHJp
dmVycy9ncHUvZHJtL3Rpbnlkcm0vbWlwaS1kYmkuYwpFcnJvcjogQ2Fubm90IG9wZW4gZmlsZSAu
L2RyaXZlcnMvZ3B1L2RybS90aW55ZHJtL21pcGktZGJpLmMKCkl0IGxvb2tzIGxpa2Ugc29tZSBv
ZiB0aGUgcnN0IGZpbGUgcmVmZXJlbmNlcyB0byB0aW55ZHJtIHJlbGF0ZWQKdGhpbmdzIG5lZWQg
dXBkYXRpbmcuCgpSZWdhcmRzLAoKSGFucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
