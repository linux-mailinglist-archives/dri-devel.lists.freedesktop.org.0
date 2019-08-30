Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E89DA3296
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7E96E321;
	Fri, 30 Aug 2019 08:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 30 Aug 2019 04:41:39 UTC
Received: from mx1.ucr.edu (mx1.ucr.edu [138.23.248.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A296E22C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 04:41:39 +0000 (UTC)
IronPort-SDR: V0plZ6H20oqHDnowoIVjM1kvuinZ2xzl1HA679Q136svivrgoG1y3XxG+GLmO7wD20oa6rreeU
 2qS7AKWBfm0KgbfS5K74PAXbvT02fZTmdG7SUSEjkY15zVmB3jH3J7DZ/yiy2D/KytgMBqARuF
 XupRqk2QuBUvVLoEP0Hecf0TTXPk8oCxKUtsOp3nML3ZefO1OZKWT0UrBcYt+iliNf0wYcBxLs
 01pxZj1lI03GYDTTCCv9o8utHWLG5Q7H/xosHyjlz9BXTe7CSZF7gyQCCgIFhIrmpeVdY2ryEV
 HzE=
IronPort-PHdr: =?us-ascii?q?9a23=3APNGLqBdicf+UJPco5opstI0flGMj4u6mDksu8p?=
 =?us-ascii?q?Mizoh2WeGdxcS6ZB7h7PlgxGXEQZ/co6odzbaP6ea5BzdLsc/JmUtBWaQEbw?=
 =?us-ascii?q?UCh8QSkl5oK+++Imq/EsTXaTcnFt9JTl5v8iLzG0FUHMHjew+a+SXqvnYdFR?=
 =?us-ascii?q?rlKAV6OPn+FJLMgMSrzeCy/IDYbxlViDanbr5+MQu6oR/MusQXj4ZuJaU8xg?=
 =?us-ascii?q?bUqXZUZupawn9lK0iOlBjm/Mew+5Bj8yVUu/0/8sNLTLv3caclQ7FGFToqK2?=
 =?us-ascii?q?866tHluhnFVguP+2ATUn4KnRpSAgjK9w/1U5HsuSbnrOV92S2aPcrrTbAoXD?=
 =?us-ascii?q?mp8qlmRAP0hCoBKjU063/chNBug61HoRKhvx1/zJDSYIGJL/p1Y6fRccoHSW?=
 =?us-ascii?q?ZdQspdUipMAoa9b4sUFOoBPOBYr4bgrFUQtBW1GAesBOLxxT9Mm3D9wKk23u?=
 =?us-ascii?q?o9HQ3D2gErAtAAv2nOrNjtNKkcT/27wqfLwzvEdP5axSvx5ZLUfh07vf2AQb?=
 =?us-ascii?q?R9etfRx0k1EAPFi02dpo7kPzKU1uQNrm+b5PdnWOOvim8nqxt+ojmzysswhI?=
 =?us-ascii?q?TEnZ8VxUze9Slj3ok6OMC4RVd9bNW5E5VQrzmXO5VqTs4mWW1luyY3xqcYtZ?=
 =?us-ascii?q?KmYCQG0okryhrcZvCfboSF4xbuWPyPLTp2hH9pYqyziheo/UWixeDxUNS/3k?=
 =?us-ascii?q?xQoSpfiNbMs2gA1xnU6seaVPRw5lyh2TOT1wDL7eFEPFw0mbLbK5E/xr4wkY?=
 =?us-ascii?q?IesUHZES/3nEX6lbeWdks59uSx5eTrf7Hrq5yGO497jQH+NasumsihDugiLg?=
 =?us-ascii?q?cOWG2b9fy91L3l40L5XK1HguMqnqTdqpzXJsQWqrSnDwNIzoov8QuzAjOl3d?=
 =?us-ascii?q?gAmHkINlNFeBaJj4jzPFHOJej1DPe+glSsijhrxuzKMqHvD5jWM3jMjK3hca?=
 =?us-ascii?q?xj5EFB1Qo/1cpf6I5MCrEdPPLzXVf8u8HCDh84KgC73vjoCMtj2YMaQm+PBq?=
 =?us-ascii?q?6ZMLjOsV+T/O4vLfOMa5ELtzngNfcl/P3ujWM+mV8FZ6Wp2oEXaH/rVtp8JE?=
 =?us-ascii?q?DMUHv+gsoGWTMbrAo3TbSy03WfWiQVanqvCfFvrgonAZ6rWN+QDrumh6aMiW?=
 =?us-ascii?q?LkRpA=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EZAQCqgmddgMbSVdFlHgEGBwaBVgY?=
 =?us-ascii?q?LAYNXTBCNHYZcAQEBBosfGHGFeYooAQgBAQEMAQEtAgEBhD+CWyM3Bg4CAwg?=
 =?us-ascii?q?BAQUBAQEBAQYEAQECEAEBCQ0JCCeFQ4I6KYJgCxYVUoEVAQUBNSI5gkcBgXY?=
 =?us-ascii?q?UnTyBAzyMIzOIaQEIDIFJCQEIgSKHHoRZgRCBB4ERgmRsh2OCRASBLgEBAZR?=
 =?us-ascii?q?OlgUBBgIBggwUgXKSUyeEMIkZixMBpiQCCgcGDyGBRYF7TSWBbAqBRJEnHzO?=
 =?us-ascii?q?BCI5VAQ?=
X-IPAS-Result: =?us-ascii?q?A2EZAQCqgmddgMbSVdFlHgEGBwaBVgYLAYNXTBCNHYZcA?=
 =?us-ascii?q?QEBBosfGHGFeYooAQgBAQEMAQEtAgEBhD+CWyM3Bg4CAwgBAQUBAQEBAQYEA?=
 =?us-ascii?q?QECEAEBCQ0JCCeFQ4I6KYJgCxYVUoEVAQUBNSI5gkcBgXYUnTyBAzyMIzOIa?=
 =?us-ascii?q?QEIDIFJCQEIgSKHHoRZgRCBB4ERgmRsh2OCRASBLgEBAZROlgUBBgIBggwUg?=
 =?us-ascii?q?XKSUyeEMIkZixMBpiQCCgcGDyGBRYF7TSWBbAqBRJEnHzOBCI5VAQ?=
X-IronPort-AV: E=Sophos;i="5.64,443,1559545200"; 
   d="scan'208";a="4951583"
Received: from mail-pf1-f198.google.com ([209.85.210.198])
 by smtp1.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 21:35:07 -0700
Received: by mail-pf1-f198.google.com with SMTP id g1so1060182pfo.4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 21:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=07dOxqCdQxKDoU2+68GM0KeX5KWpD+AWua+kX8OJRIA=;
 b=XU4Km+efqzCkwJ/uBjw16+FUgX/IkUNX7wlYhhtJOKHC6njo0zfjtCa+71mdyw0wLV
 IGL/djYiSzCX1GM4Z+drhdVmV7BOFUqGdbsTdDZ9ZwFvrs6Iv56WvPczktAJL2TIDmRc
 OpVlHHIIesvagOPu4KqXtRdLVKS+ZKslK/37gOyML8L8174qrYK8AhNYdlsQIUX9w9u5
 ug9Nmd8FX0Gh2NiLx0pUfiwW/5G6Jbn7QGQsGJPIu/LurhireFpQ0BcdLcFSV+PKuNXy
 bbUq8uK4cgHrtKCgla5RTJupcoQ+BcqN4kHkm+cU5Psck5mKmfDxm3vfwiphNXfET3Ag
 Q0TQ==
X-Gm-Message-State: APjAAAVI32MYsS5LrqoIHCThUSbvGbNmDuh3VEmWl7F1qt8fdvJhlmsl
 i/lcCSsM6Z1Yjx4Q/zRAGmxE9EgJpLoY5BIkG1Kvn2UrjS6Md6SKA5a2r9WxNPY7JNd3b+1KODg
 BPYz9sxcIC/tNEAJD4bg/WbWyMiu9MQ==
X-Received: by 2002:a17:902:8204:: with SMTP id
 x4mr13607505pln.37.1567139670465; 
 Thu, 29 Aug 2019 21:34:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwyvmLToVZOecb3FxtZYyGbzvjpkmy+blWZgKh+cvqVJJgCWAhy1BthWVCA7K/ffjCHY7QWwA==
X-Received: by 2002:a17:902:8204:: with SMTP id
 x4mr13607482pln.37.1567139670076; 
 Thu, 29 Aug 2019 21:34:30 -0700 (PDT)
Received: from Yizhuo.cs.ucr.edu (yizhuo.cs.ucr.edu. [169.235.26.74])
 by smtp.googlemail.com with ESMTPSA id 6sm5204331pfa.7.2019.08.29.21.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 21:34:29 -0700 (PDT)
From: Yizhuo <yzhai003@ucr.edu>
To: 
Subject: [PATCH] drm/amd/powerplay: Variable ps could be NULL when it get
 dereferenced
Date: Thu, 29 Aug 2019 21:35:04 -0700
Message-Id: <20190830043504.23760-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1567140134; x=1598676134;
 h=from:to:cc:subject:date:message-id;
 bh=XPfJegQ++l69vVm04ifZLNdv62gocxHQ8bqgeCGaYj0=;
 b=Y58xD1poYxY0sSivQUm7oTxffFzsVJSOvN5KH6+rxDzKUn8KrcY+9T60
 Wahx/qS6gdEtIYBppt7PjsEWxMSLMOFzzIqzJTt9V7SLp4Z+vvUcf5O3H
 TtFCZKxGFA4oSBHEdTwTc1ex/HOUvIWjyvQmaclBVL4Wsg/Rq9K+QVZaU
 OZXfYx8CPKhA7NyEYuiuZDE8+dJbYvYdJgXt1BXfToqVB5oTrnLzhOVGS
 WVptrl4xdNmIvuJxy29Bzq8DuIw0nWwJyjzLbKSwEhIWmVTodvEDoKELl
 lRErabzFUPfm+Vv96vYTglFEUzSgAudPcQMjucsD7byR4MWzyhwdbeqYo
 A==;
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
Cc: csong@cs.ucr.edu, David Airlie <airlied@linux.ie>, zhiyunq@cs.ucr.edu,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Yizhuo <yzhai003@ucr.edu>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zaWRlIGZ1bmN0aW9uIGN6X2dldF9wZXJmb3JtYW5jZV9sZXZlbCgpLCBwb2ludGVyIHBzIGNv
dWxkIGJlIE5VTEwgdmlhCmNhc3RfY29uc3RfUGh3Q3pQb3dlclN0YXRlKCkuIEhvd2V2ZXIsIHRo
aXMgcG9pbnRlciBpcyBkZXJlZmVyZW5jZWQKd2l0aG91dCBhbnkgY2hlY2ssIHdoaWNoIGlzIHBv
dGVudGlhbGx5IHVuc2FmZS4KClNpZ25lZC1vZmYtYnk6IFlpemh1byA8eXpoYWkwMDNAdWNyLmVk
dT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9jel9od21nci5jIHwg
MyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9jel9od21nci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvY3pfaHdtZ3IuYwppbmRleCBiYzgzOWZmMGJkZDAuLmQy
NjI4ZTdiNjEyZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdt
Z3IvY3pfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9j
el9od21nci5jCkBAIC0xNzk5LDYgKzE3OTksOSBAQCBzdGF0aWMgaW50IGN6X2dldF9wZXJmb3Jt
YW5jZV9sZXZlbChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBjb25zdCBzdHJ1Y3QgcHBfaHdfcAog
CWRhdGEgPSAoc3RydWN0IGN6X2h3bWdyICopKGh3bWdyLT5iYWNrZW5kKTsKIAlwcyA9IGNhc3Rf
Y29uc3RfUGh3Q3pQb3dlclN0YXRlKHN0YXRlKTsKIAorCWlmICghcHMpCisJCXJldHVybiAtRUlO
VkFMOworCiAJbGV2ZWxfaW5kZXggPSBpbmRleCA+IHBzLT5sZXZlbCAtIDEgPyBwcy0+bGV2ZWwg
LSAxIDogaW5kZXg7CiAJbGV2ZWwtPmNvcmVDbG9jayA9IHBzLT5sZXZlbHNbbGV2ZWxfaW5kZXhd
LmVuZ2luZUNsb2NrOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
