Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E649214E7
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02072898C6;
	Fri, 17 May 2019 07:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2BE8989C;
 Fri, 17 May 2019 07:27:42 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id y11so3233448pfm.13;
 Fri, 17 May 2019 00:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5yR7w+lbXREb1V+QECtjDDonB2NG2+mD0zE8iEbLsOA=;
 b=VqYQBei/i9EYcTA3ckdZqfD8ceOuHJhdeawiEReVkTHqQTy8QIZBh1SYfBomxnmTmL
 uFo0HxAhI2AE6D1TcQPeeAphrc83kxiMOGxYiv4YXijFxwdF/wEjrHzCoC3yIEO7TSSf
 ZNxVAXjr++/jrDX7TuOV6RDHwMRRc4y+SQM2jChSy59q6+oLBEtQCyZqmPCQuXx/+XLi
 8CkqwP796GquQu0BFOSq0TZhgH8xSTSGDTKmpieBaCF7xl+HVrNzE7pwqeTFJsCyUf24
 kqj1evES+TcQ65wtcMIRQA5Z6f2n0fPuikqbNuVY+A1MTCXocQcNUl0GqQM4J/EcbNF3
 1Fwg==
X-Gm-Message-State: APjAAAUl3u0fFSCsBPRVSg2FYOOfMcISXlzXcANSEfmQUx99mSRC6pQb
 bxLDPpyXQQdHX8nIjtVOim+BA/vR
X-Google-Smtp-Source: APXvYqwkpkqsGtVIR2m+JggYHRaeSu01PUNRAiPSAH7+euE+tdrLQfGM8RMw5R18pbOHoltUL9EtUQ==
X-Received: by 2002:a65:64da:: with SMTP id t26mr55379408pgv.322.1558078061730; 
 Fri, 17 May 2019 00:27:41 -0700 (PDT)
Received: from localhost ([175.223.38.122])
 by smtp.gmail.com with ESMTPSA id m12sm3674967pgi.56.2019.05.17.00.27.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 May 2019 00:27:40 -0700 (PDT)
Date: Fri, 17 May 2019 16:27:37 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: drm/nouveau/core/memory: kmemleak 684 new suspected memory leaks
Message-ID: <20190517072737.GA651@jagdpanzerIV>
References: <20190517061340.GA709@jagdpanzerIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190517061340.GA709@jagdpanzerIV>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Fri, 17 May 2019 07:54:52 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5yR7w+lbXREb1V+QECtjDDonB2NG2+mD0zE8iEbLsOA=;
 b=rL1R5dEGxFf0mAiouBM4WyIyJZ8lQ/FFAJS1ZztuHLBBhU/AuQSJk59uh2/Naurhzu
 JsZaG5ziu7sOP04pfroQYmEnw+an5tgyQ3pQjx680Ve6Q0NUGh94x33CUPaabRViKSL8
 Hys5i+cUGtBGyBGtnWDDzfhGLFa4Kyp41YBM7y3s8z6Qlnp5DIWH19wR2dPsyCcWK5lQ
 o0klD35f6BhlECxzjiBlm3d17a6dMOHRZi0LT2f8Y1ymTYC3KwPaSiiQqnUpV/HZ/V0J
 +Lo46zzei2RJNXEhbjv8u8WmdckJw8wSHi1xjVxzErXCdn7OacgK8Edo1JvwuCif/SrY
 AxZQ==
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gKDA1LzE3LzE5IDE1OjEzKSwgU2VyZ2V5IFNlbm96aGF0c2t5IHdyb3RlOgoKPiAuLi4gYnV0
IG1vc3QgbGlrZWx5IGl0J3MgdXR0ZXJseSB3cm9uZy4KPiAKCkpGSSwgSSByZW1vdmVkIGttZW1s
ZWFrIGFubm90YXRpb24gYW5kIGFkZGVkIHRoZSBmb2xsb3dpbmcKdGhpbmc6CgpAQCAtMzYwLDYg
KzM2MCw3IEBAIGdwMTAwX3ZtbV92YWxpZChzdHJ1Y3QgbnZrbV92bW0gKnZtbSwgdm9pZCAqYXJn
diwgdTMyIGFyZ2MsCiAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwogICAg
ICAgICAgICAgICAgfQoKKyAgICAgICAgICAgICAgIGtmcmVlKG1hcC0+dGFncyk7CiAgICAgICAg
ICAgICAgICByZXQgPSBudmttX21lbW9yeV90YWdzX2dldChtZW1vcnksIGRldmljZSwgdGFncywK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG52a21fbHRjX3RhZ3Nf
Y2xlYXIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmbWFwLT50
YWdzKTsKCgktc3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
