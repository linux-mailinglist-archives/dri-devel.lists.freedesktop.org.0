Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 380E4165C8B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 12:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BA46ED2D;
	Thu, 20 Feb 2020 11:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936626E1F7;
 Thu, 20 Feb 2020 11:13:58 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id u6so1049914vkn.13;
 Thu, 20 Feb 2020 03:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NhBmINf0puzyUWEZyQxItzacEDzqS3ndvGzfUrAM0dk=;
 b=Ykt69MEuoWDG+7d0bVtZVVKOYN18csuAs8+jLIp2wL+EjzQKOmkll7hc87nLgVSyTN
 gDiEMn6YH3b3ZkBvnvrL73JGbbNnx3xUru6EOePr9dYSZiuJoMZy5MaE1LA7y8AHzhWQ
 68NoePJoqFh7sSCdYfgSpjuVDxtwgha4teo0hccc2foDgUgUzXO8svH86+8JFxuPiJLQ
 9aGqcDjp+l5/WjQH14zb296A9JcfnkmzAnBxGsUdA4bqVWFDfJBbRiaCN4q9DN9rPllz
 ejfLXU9KwLL1uyPlgWkrQx3Sjjkxnu4HFYd5/6Pno/UrAM7X2QmuWOXZr0Enz9sLpzFS
 5+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NhBmINf0puzyUWEZyQxItzacEDzqS3ndvGzfUrAM0dk=;
 b=UEZJEYIF/CcN7QC/NvnkALdO/ayYaYYureAMIWYExGPrGGOTYFrRPWMnKJdbkk2zmX
 /LxPEmMG0NduFJtv2EAXk51IHwaeA+gDGiA7Y7yWIv2rr+tezAYrv8zaxHBX8Em5jqC+
 Gmuemu4usV9qxkV/M6oNs9Y+wKS6Z90NfjtcVpLTZuPcORI6MFEWCl4WWoOwxYaS5Uaj
 GYt7IxCi/gmZGZIt0BpM4MCRrn0SKZT6301QVyU7NwL1G4uji5xY54uHncQ0/jj1FZ2P
 p84qNl2NltgL57QLgrNxvUNljnzC7RQuM0c6j3NaaHo2R4ZZmb2n3bFEF5VaKirQLoFk
 YBOw==
X-Gm-Message-State: APjAAAWhaJouIlEQkha7plfXEnsSBV3U2r/7le4zkQa/MdTUuRFFScO3
 McIZLY+ihzYVswu8WyEqXMXEaYIGIIA/x8hVldLL/usp
X-Google-Smtp-Source: APXvYqwsiWaxDTghf33ju1XSnLPSfcN0ZRGJAsnhVbvkv4iNDaxsGjbW8E5KXSNAm0cktX3EUzKB1QWvBnTicZJSe5c=
X-Received: by 2002:a05:6122:1185:: with SMTP id
 x5mr13900116vkn.38.1582197237783; 
 Thu, 20 Feb 2020 03:13:57 -0800 (PST)
MIME-Version: 1.0
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20200219203544.31013-4-ville.syrjala@linux.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 20 Feb 2020 11:13:46 +0000
Message-ID: <CACvgo51sei-FosbxvjW5-JRyYbP_qJ-SL2q1PyxjzN7vqk1YkQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 03/12] drm/i915: Introduce some local intel_dp
 variables
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBGZWIgMjAyMCBhdCAyMDozNiwgVmlsbGUgU3lyamFsYQo8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IFRoZSBkcnJzIGNvZGUgZGVyZWZlcmVuY2Vz
IG1vZGUtPnZyZWZyZXNoIHZpYSBzb21lIHJlYWxseSBsb25nIGNoYWluCj4gb2Ygc3RydWN0dXJl
cy9wb2ludGVycy4gQ291bGRuJ3QgZ2V0IGNvY2NpbmVsbGUgdG8gc2VlIHRocm91Z2ggYWxsCj4g
dGhhdCBzbyBsZXQncyBhZGQgc29tZSBsb2NhbCB2YXJpYWJsZXMgdG8gaGVscCBpdC4KPgpUaGVy
ZSdzIGEgbGltaXQgdG8gdGhlIG1hZG5lc3MgdGhhdCBjb2NjaW5lbGxlIGNhbiB0YWtlIDotUApP
dGhlciBkcnJzIGZ1bmN0aW9ucyBhbHJlYWR5IHVzZSBpbnRlbF9kcCwgc28gbWlnaHQgYXMgd2Vs
bCBiZSBjb25zaXN0ZW50LgoKUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292
QGNvbGxhYm9yYS5jb20+CgotRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
