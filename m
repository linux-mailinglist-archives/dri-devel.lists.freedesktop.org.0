Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12B93F59B1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 10:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E4B899EA;
	Tue, 24 Aug 2021 08:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A217899EA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 08:11:05 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210824081103euoutp01317ec3724774ceafd1c1cd0cd399a196~eL8r1MAEN1096810968euoutp01R
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 08:11:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210824081103euoutp01317ec3724774ceafd1c1cd0cd399a196~eL8r1MAEN1096810968euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1629792663;
 bh=gZr5dpcHDrH2X9997OHDMU7bs/LvNc9aUEW5CaKNinQ=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Nh7j0jrMJ+pmVek2x19lYv1GGw0d4+k98JosHNinepSr9VIYjxUZ3tJoujkLBQcZ0
 9B5ULOqCu5Xq0rcB5m2KtUUPym9OcHNi57GP3lMznegeUQk4Ty6L+h8+jMj7VPLnJ8
 r7WVsqAKnsmpZ4SYVArmHrJMekCrUz6VF5SmOdx4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210824080603eucas1p17cd0ef325e6c4f19dadc16fc9aff0557~eL4T6AXQr0663406634eucas1p1K;
 Tue, 24 Aug 2021 08:06:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 62.D1.56448.B68A4216; Tue, 24
 Aug 2021 09:06:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210824080602eucas1p113859afa5f1f266edebc3a3f541ba763~eL4TJ18bY0697406974eucas1p1L;
 Tue, 24 Aug 2021 08:06:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210824080602eusmtrp2ada1499178cd1963038332a99042c873~eL4TI2LSs1739517395eusmtrp2s;
 Tue, 24 Aug 2021 08:06:02 +0000 (GMT)
X-AuditID: cbfec7f5-d3bff7000002dc80-69-6124a86b1a5f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 25.AD.31287.A68A4216; Tue, 24
 Aug 2021 09:06:02 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210824080601eusmtip2b98ea70d976c47e354d9dfb8542c7148~eL4SYYtiX2540925409eusmtip2o;
 Tue, 24 Aug 2021 08:06:01 +0000 (GMT)
Message-ID: <77810b2c-77a2-da0f-a85b-401c3daf211c@samsung.com>
Date: Tue, 24 Aug 2021 10:06:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0)
 Gecko/20100101 Thunderbird/92.0
Subject: Re: [PATCH v3 1/8] drm/bridge: Add documentation sections
Content-Language: en-GB
To: Maxime Ripard <maxime@cerno.tech>, Jonas Karlman <jonas@kwiboo.se>, Sam
 Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Neil Armstrong <narmstrong@baylibre.com>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Robert Foss
 <robert.foss@linaro.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210823084723.1493908-2-maxime@cerno.tech>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCKsWRmVeSWpSXmKPExsWy7djP87rZK1QSDZpm8Fv0njvJZLH8zDpm
 iytf37NZPJ+/jtHi5JurLBadE5ewW1zeNYfNYuHHrSwWM378Y7Q41Bdt8WnWQ2aLFT+3Mlr8
 3DWPxWLLm4msDnwe72+0snvcOXeezWPnrLvsHrM7ZrJ6LN7zksnjxIRLTB53ru1h89j+7QGr
 x7yTgR73u48zeSyZdpXNY/Ppao/Pm+QCeKO4bFJSczLLUov07RK4MvbOXcNUsJ254vr32UwN
 jG+Zuhg5OSQETCRam64zdzFycQgJrGCUWPC4jwnC+cIoceLsDKjMZ0aJJ/vvsHYxcoC1zN5X
 DdItJLCcUaL1XQREzXtGiZnbNrGDJHgF7CTaV+9nAbFZBFQlOr9MZoGIC0qcnPkEzBYVSJB4
 vvQrE8hMYQEniR1fC0DCzALiEk1fVrKCzBQR+M0ssaX5PBtEwlHi5tRjrCA2m4CmxN/NN8Hi
 nAKWEm+XTGWCqJGXaN46G+xoCYHDnBKn765jg/jTRaJnw30WCFtY4tXxLewQtozE/53zoWFR
 L3F/RQtUcwejxNYNO5khEtYSd879YgO5lBlo8/pd+hBhR4ndR5qggcInceOtIMQNfBKTtk1n
 hgjzSnS0CUFUK0rcP7sVaqC4xNILX9kmMCrNQgqVWUjen4Xkm1kIexcwsqxiFE8tLc5NTy02
 zkst1ytOzC0uzUvXS87P3cQITIin/x3/uoNxxauPeocYmTgYDzFKcDArifD+ZVJOFOJNSays
 Si3Kjy8qzUktPsQozcGiJM67a+uaeCGB9MSS1OzU1ILUIpgsEwenVAOT6raV0XVvSvd3hnIV
 8v9fKnprf2k5w9/773kWcMiK1M8p3veNQzN2k3jOTDNVFb7X9tLZO3hVZ831tj163MJR7PEZ
 pXSdxF9bnDU2/T+sxfldivGXbqm3zIpnp+8rbnW03P7FyODC8oyOFM67NzoP/Jp8e2/1tAUP
 VA7UNV/cJKv2Uvmnz7ucvUfa52yZeOzpt/ozMpKSxckTM6zM5jNfE1pw8NucxvJ2hkTpymcf
 ysr+cRz6uq1zW4LgfF9F7rVyMh/tpQ73/dH9FnvuttNf4WU52sLT1/WmfzT9wLp4x5OsUJW9
 U6cVdliqHX7jfiHXq3XTh0tPWi9c7SoJ+d6yq/qUeMD2v2pcBernA4x/KrEUZyQaajEXFScC
 AJX/V5b3AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOIsWRmVeSWpSXmKPExsVy+t/xe7pZK1QSDda/F7PoPXeSyWL5mXXM
 Fle+vmezeD5/HaPFyTdXWSw6Jy5ht7i8aw6bxcKPW1ksZvz4x2hxqC/a4tOsh8wWK35uZbT4
 uWsei8WWNxNZHfg83t9oZfe4c+48m8fOWXfZPWZ3zGT1WLznJZPHiQmXmDzuXNvD5rH92wNW
 j3knAz3udx9n8lgy7Sqbx+bT1R6fN8kF8Ebp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZ
 GpvHWhmZKunb2aSk5mSWpRbp2yXoZeydu4apYDtzxfXvs5kaGN8ydTFycEgImEjM3lfdxcjF
 ISSwlFGi4+0Dli5GTqC4uMTu+W+ZIWxhiT/Xutggit4ySqw/eZoNJMErYCfRvno/WAOLgKpE
 55fJLBBxQYmTM5+A2aICCRK7D3exgywTFnCS2PG1ACTMDDS/6ctKVhBbROAvs8SXRbEQcUeJ
 m1OPsULs2s0oseLXc7AiNgFNib+bb4Lt5RSwlHi7ZCoTRIOZRNfWLkYIW16ieets5gmMQrOQ
 nDELyb5ZSFpmIWlZwMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzAFbDv2c/MOxnmvPuod
 YmTiYDzEKMHBrCTC+5dJOVGINyWxsiq1KD++qDQntfgQoykwLCYyS4km5wOTUF5JvKGZgamh
 iZmlgamlmbGSOO/WuWvihQTSE0tSs1NTC1KLYPqYODilGpiaJcyOXi7OnK2xwUvKTFfKOWx1
 wT57tZCo9q75k0JPPLh3NFxx0vdLCqcf9Ih3x7zkPvrdsuSXlPrjE4zTFZir/vX8yq6/rK1d
 +ZU9slXs1ouJ8uEPLKZenru9RyFhjqvetw+ML5hSVJYcS9R9suV6/pkwa7MMy9eWs2++yBDX
 WLiaT5uzg+Fa/R4HgYp/aft62Q3U5yTf/7+VYcWmCaJV0SxJkkJLhFv9Uv4dnl/Ieiz63Nvt
 LO5hQfzPg3TKmrc6HbTccbQhqe2QoRhL8aKJMgyhV0Q5O9g57lYGRPmyZ2eukkn5+/lFS83X
 95zfD5u3Hb164aTWtXb73SxFosrv2hK0a+1//744g/H/USWW4oxEQy3mouJEACarIS6KAwAA
X-CMS-MailID: 20210824080602eucas1p113859afa5f1f266edebc3a3f541ba763
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210823084744eucas1p1c7aff3a2e0eac52553954cb784165a16
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210823084744eucas1p1c7aff3a2e0eac52553954cb784165a16
References: <20210823084723.1493908-1-maxime@cerno.tech>
 <CGME20210823084744eucas1p1c7aff3a2e0eac52553954cb784165a16@eucas1p1.samsung.com>
 <20210823084723.1493908-2-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


W dniu 23.08.2021 o 10:47, Maxime Ripard pisze:
> The bridge documentation overview is quite packed already, and we'll add
> some more documentation that isn't part of an overview at all.
>
> Let's add some sections to the documentation to separate each bits.
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej
