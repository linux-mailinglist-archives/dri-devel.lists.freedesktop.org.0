Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739C43672FB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 20:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743CA89DFB;
	Wed, 21 Apr 2021 18:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BD289DFB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 18:58:27 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id sd23so56391547ejb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 11:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=54Mx0VE5DUiDmkj0gLV5ZKMgKjIaEBZW9DsfzslmghU=;
 b=cIwEitSreHvoU5Rh+cIH0tZLKycMvzPLdGHqiw+jXsqD8kR6ex55OetBSsTyUBV4LX
 59EyQE51R+6lLsUh1H+5UYSTC01ru38vMT+B2W9M3ubWlH87hz3sdiXgFkLq473Em6xM
 0PnBeZZ25Boh+7HU+asoGDpKftZAK8Hu8m0FFHSM5WWS7CcCHq/P6ZmzkE9NzF7plnZi
 kKqp+cED1NzKcctzQgoGpUNDK54Qe1RGy/WbuSqi8YjYuzPAhYOJt8KGs7tNG7n3IL0N
 9RcWqS/lIDKe6URfyas7uSnO4ef4M0a4PMTQx0i8lX7MyVopoh9ZxfVW2CAt7vXdUmrt
 4Xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=54Mx0VE5DUiDmkj0gLV5ZKMgKjIaEBZW9DsfzslmghU=;
 b=OWSN7avZD8Osc78PoQMwHdMaT8fCEy27YqGvkpnwHWdJOOJfUCVTeQTQtWHCSMa2M+
 aoXEV7aEWrb18bXdF9a5dTFwn97Jm8hxaj+W774CRzEVI/Fx/idgr3VDoJh7P+dhkpDs
 Z9ay+Lxpxl/z0xaNIjWC9ER2bjdc2wMfKaKze3hJTreloyskZ+jJz+aEQOHIf8ZdK6pl
 IWDVvOi4h+1YkAUw/fNTbqwSxoF/RRncRMeNC/Kk/2RodX2ZIn37BoH4Ew2O2oMVRCHV
 B452OvxAS0E9PbMJON+VIdPfjz/trXXOuoVmmAa8CerdiwTHgpzTa+d81oP6nD+e18ok
 aMJg==
X-Gm-Message-State: AOAM530xuIR199Uu9hBb8ICUycwuveVO9u+9YYwR7wm6bKyDid1ikzAb
 9Q3WZVZfhhOKXSGijBMe0G8ayK+uYzQmpDgp22JbN5B5qQ0=
X-Google-Smtp-Source: ABdhPJxr+QMxd/2sbSjF2e5fiqBz1ZUDqK8kWBFS4fujTcB9PfbvZM0Sf6S5HTljFDtzkJfTTvg6NHM9k333nq6g1KY=
X-Received: by 2002:a17:906:5fce:: with SMTP id
 k14mr35082568ejv.9.1619031505577; 
 Wed, 21 Apr 2021 11:58:25 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 22 Apr 2021 04:58:14 +1000
Message-ID: <CAPM=9tyXf8aJnBPfd8E6aT-61PCayKy7M4MM4Sq+OLk+MwvohA@mail.gmail.com>
Subject: umn experiment patches fallout in drm
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexdeucher@gmail.com>, 
 Ben Skeggs <skeggsb@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9va2luZyBhdCB0aGUgdW1uLmVkdSBwYXRjaGVzIGZvciBkcm0gaW4gdGhlIGxhc3Qgd2hpbGUs
IGFsbCB0aGUKcmVmY291bnQgb25lcyBsb29rIGJvZ3VzLAoKMjAyMC0wNi0xMyAyMDo0OCAtMDUw
MCBBZGl0eWEgUGFra2kgbyBkcm0vbm91dmVhdTogZml4IHJlZmVyZW5jZSBjb3VudApsZWFrIGlu
IG5vdXZlYXVfZGVidWdmc19zdHJhcF9wZWVrCjIwMjAtMDYtMTMgMjA6MjIgLTA1MDAgQWRpdHlh
IFBha2tpIG8gZHJtL25vdXZlYXU6IEZpeCByZWZlcmVuY2UgY291bnQKbGVhayBpbiBub3V2ZWF1
X2Nvbm5lY3Rvcl9kZXRlY3QKMjAyMC0wNi0xMyAyMDoyOSAtMDUwMCBBZGl0eWEgUGFra2kgbyBk
cm0vbm91dmVhdTogZml4IHJlZmVyZW5jZSBjb3VudApsZWFrIGluIG52NTBfZGlzcF9hdG9taWNf
Y29tbWl0CjIwMjAtMDYtMTMgMjA6NDEgLTA1MDAgQWRpdHlhIFBha2tpIG8gZHJtL25vdXZlYXU6
IGZpeCBtdWx0aXBsZQppbnN0YW5jZXMgb2YgcmVmZXJlbmNlIGNvdW50IGxlYWtzCjIwMjAtMDYt
MTMgMjA6MzMgLTA1MDAgQWRpdHlhIFBha2tpIG8gZHJtL25vdXZlYXUvZHJtL25vdmVhdTogZml4
CnJlZmVyZW5jZSBjb3VudCBsZWFrIGluIG5vdXZlYXVfZmJjb25fb3BlbgoyMDIwLTA2LTEzIDIx
OjIxIC0wNTAwIEFkaXR5YSBQYWtraSDilIIgbyBkcm0vcmFkZW9uOiBGaXggcmVmZXJlbmNlCmNv
dW50IGxlYWtzIGNhdXNlZCBieSBwbV9ydW50aW1lX2dldF9zeW5jCjIwMjAtMDYtMTMgMjA6NTUg
LTA1MDAgQWRpdHlhIFBha2tpIOKUgiDilIIgbyBkcm0vcmFkZW9uOiBmaXggbXVsdGlwbGUKcmVm
ZXJlbmNlIGNvdW50IGxlYWsKMjAyMC0wNi0xMyAxNDozMiAtMDUwMCBRaXVzaGkgV3UgICAg4pSC
IOKUgiDilIIgbyBkcm0vYW1ka2ZkOiBGaXggcmVmZXJlbmNlCmNvdW50IGxlYWtzLgoKVGhlc2Ug
b25lcyBsb29rIHNhbmUgYnV0IG1heWJlIHdlIHNob3VsZCByZXZlcnQgdGhlbSBhbGwgYW55d2F5
cy4KCjIwMTktMTItMTUgMTM6NDMgLTA2MDAgQWRpdHlhIFBha2tpIOKUgiDilIIg4pSCIOKUgiBv
IGRybTogcmVtb3ZlIGR1cGxpY2F0ZQpjaGVjayBvbiBwYXJlbnQgYW5kIGF2b2lkIEJVR19PTgoy
MDE5LTEwLTE3IDIzOjQxIC0wNTAwIEthbmdqaWUgTHUgICDilIIg4pSCIOKUgiDilIIg4pSCIG8g
ZHJtL2dtYTUwMDogZml4IG1lbW9yeQpkaXNjbG9zdXJlcyBkdWUgdG8gdW5pbml0aWFsaXplZCBi
eXRlcwoyMDE5LTEwLTE3IDIzOjI5IC0wNTAwIEthbmdqaWUgTHUgICDilIIg4pSCIOKUgiDilIIg
4pSCIG8gZ21hL2dtYTUwMDogZml4IGEKbWVtb3J5IGRpc2Nsb3N1cmUgYnVnIGR1ZSB0byB1bmlu
aXRpYWxpemVkIGJ5dGVzCjIwMTktMDMtMjQgMTg6MTYgLTA1MDAgS2FuZ2ppZSBMdSAgIOKUgiDi
lIIg4pSCIOKUgiDilIIg4pSCIG8gZHJtL3YzZDogZml4IGEKbWlzc2luZyBjaGVjayBvZiBwbV9y
dW50aW1lX2dldF9zeW5jCjIwMTktMDMtMDggMjI6MzYgLTA2MDAgS2FuZ2ppZSBMdSAgIOKUgiDi
lIIg4pSCIOKUgiDilIIg4pSCIOKUgiBvIGRybTogdmttczogY2hlY2sKc3RhdHVzIG9mIGFsbG9j
X29yZGVyZWRfd29ya3F1ZXVlCgpCZW4sIEFsZXggY2FuIHlvdSBsaW5lIHVwIHJldmVydHMgZm9y
IG5leHQgZm9yIGFsbCBvZiB0aGUKbm91dmVhdS9hbWRncHUvcmFkZW9uIG9uZXM/CgpEYXZlLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
