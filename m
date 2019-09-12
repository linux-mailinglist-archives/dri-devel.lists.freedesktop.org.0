Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75AFB18DB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 09:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CF06EE99;
	Fri, 13 Sep 2019 07:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013D46EC48
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 09:37:39 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id r12so15675401pfh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 02:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=azKPn+FrneIwWc48qQAexc2Wv+Q+SUix9Mavkn8EwPA=;
 b=pgI/QxVQrcFqYfMKJRAt+HqtYjHngOl2XYc3St8u8VGu7UBBkMjqSJei2k0iOTTRiy
 QZNfnAK9jRrgs2UeH9OiKsRFofmUUg2oA3vkwpkTh20VTmbVbndUHsEhoBtG7CJIVM7E
 QsTa+BG6y6zH5ccr7aDK1RH2/2j2hhFVaG9A00GfhkMLR2NSnhOGQeyn9B1dhMntzEF7
 BWsk2l/ldHKtqf9PDA+ft7nI9xBT09yiOIQF/6Dk5RLtEb80sU/7A8NohXjrgopdP1Av
 ToCjjXZpT8VS05eZwjHb+4jrGffvkAHOjUmsHUHLlb3PAChSiKUClbb6xqM7UPR07BKj
 nwMg==
X-Gm-Message-State: APjAAAUyAdKJY0aQvk6aWXPyqR4cM/PhGU31ptanzYWvHoo+JpcCXMTj
 z17tWFc3qVatycsr8B7f78pxJQxn
X-Google-Smtp-Source: APXvYqylLtuqqveCfI9uPZH1GYSULIbz9ov0h8NdWaDlqugdKZ3eYzttMaRTrr9/mlz2oT7/HTlqdA==
X-Received: by 2002:a63:4c5c:: with SMTP id m28mr38869609pgl.333.1568281059083; 
 Thu, 12 Sep 2019 02:37:39 -0700 (PDT)
Received: from [192.168.35.197] ([180.69.89.73])
 by smtp.gmail.com with ESMTPSA id n66sm38894352pfn.90.2019.09.12.02.37.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Sep 2019 02:37:38 -0700 (PDT)
To: dri-devel@lists.freedesktop.org
From: Securecoded <securecoded@gmail.com>
Subject: RK3288 DRM source for plane mirror..
Message-ID: <4e004d95-ebba-be46-0c3a-2a9e57d12775@gmail.com>
Date: Thu, 12 Sep 2019 18:37:36 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Fri, 13 Sep 2019 07:24:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=azKPn+FrneIwWc48qQAexc2Wv+Q+SUix9Mavkn8EwPA=;
 b=BVbwomv93YeIYc5wE9V+3D0QhWjtyFQCr1+6QNScZVUoX8KEkOzgeh6a/J79PDhTsj
 RcXtFUIDzMBmJhXNQptZpR/4VefMZuYK/gYe1vt+g/pSt/GvV/bFeCGcRa8zq19+qJfm
 POZfyOV5TPeWqfe6p/93ahA4Y4NrV5kch45xueJsB+MeljZs1r242THIx+/lS02FfMt4
 8HuYM/QBAm3E9nsEGWXPBUHw4G6d4oznLT58G4BkK3d/ynekA9yEXCLpi61pqfQ2ueVU
 troiAEHfuJvM0Ahl+JgIkjkvLlCwvNjVKuIpD3+KyXB0+jEZfCwXeUm+2EWRKeU5N3EJ
 utrw==
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
Content-Type: multipart/mixed; boundary="===============1841401104=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1841401104==
Content-Type: multipart/alternative;
 boundary="------------F63647C95EA9B7E7E3824B96"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F63647C95EA9B7E7E3824B96
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear all,

i'm jerry park and first driver porting with rk3288.
it is really hard time for me..

now i need plane mirror function, but my SDK could't do it.
i fount your patch project 
https://lists.freedesktop.org/archives/dri-devel/2019-January/202816.html
but i can't  download your source file. i am not be used to patch app..

so if possible could i get your patch files.

drivers/gpu/drm/rockchip/rockchip_drm_vop.c
  drivers/gpu/drm/rockchip/rockchip_drm_vop.h
  drivers/gpu/drm/rockchip/rockchip_vop_reg.c

if acceptable, it is really thankful for me.


--------------F63647C95EA9B7E7E3824B96
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Dear all,<br>
    <br>
    i'm jerry park and first driver porting with rk3288.<br>
    it is really hard time for me..<br>
    <br>
    now i need plane mirror function, but my SDK could't do it.<br>
    i fount your patch project  <a
href="https://lists.freedesktop.org/archives/dri-devel/2019-January/202816.html">https://lists.freedesktop.org/archives/dri-devel/2019-January/202816.html</a><br>
    but i can't  download your source file. i am not be used to patch 
    app..<br>
    <br>
    so if possible could i get your patch files.<br>
    <pre style="white-space: pre-wrap; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">drivers/gpu/drm/rockchip/rockchip_drm_vop.c 
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h 
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c

if acceptable, it is really thankful for me.
</pre>
  </body>
</html>

--------------F63647C95EA9B7E7E3824B96--

--===============1841401104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1841401104==--
