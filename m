Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910FBB54AD8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693D810EC0F;
	Fri, 12 Sep 2025 11:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="krWodGzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B4310EC0F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:20:24 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fCQk017410
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fb8hL5HEjKr2NxpLUkVthwekRLKNSk3tdU6N+cDThPM=; b=krWodGzoYywUyoDy
 Fo79eZ0LadN7Y3+zuA/9nI0SINjbOmR7mfzp7w3LdcAtUyWNZRtsR4u2tpW2UK8y
 WYME5A7csYND0pne7RsVq6TAOfJOq7uDngZcBpe1u5mz+bgLMwXoenu89b2qg0Me
 YmIc/8X4WSmRJs8C4IRDTBm1Q7ZZSlhphBrnRzG785RrC+03pY9jyZvrF4PoGu0/
 BGICzPEmVN+eAB7C+XjHZkLqz+PqKTLf0NrDKxwYBYRm6PaafzfWw896De1SwuxF
 haIOPStqIbheFJjpAiu6Lhk/9SBFI7X6QZkniajiUaY8zFGZvIcLiScwfg7ktz6P
 TBll9Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8uhba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:20:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b633847b94so47047521cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757676022; x=1758280822;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fb8hL5HEjKr2NxpLUkVthwekRLKNSk3tdU6N+cDThPM=;
 b=WLWaGfKLdfXu5PpX43sdUTnqvTXUftyVK1P7vSKz9KFLG5rTyBAKeEdE5rgnvlWPhc
 2dhJUQkK/C643+UkJYoNoyDykkoLe7GqII/bqEFTKwNsLJZD0Cw0OiLRImGhqz+K09A+
 xTWAtHuXfOUyHpjNXofypOi0+cbcyjuoV1edNtI5ovziEjw7j4lHh7R82/nOJE42MFnj
 RfCHalecgwakHMcW6DQqm+RYTzxZ1tnGpH6KHLoVDzXSAW6SLH60s+hkTFxdofznBW3T
 ju1olExSGFC0rG+qs4GXwjG336GY0917xyDF/e+Mt4tC6va2WfDnwDeVHZyLy8rf21x6
 OEHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDAUkj34MkmChhPT72fmYwEMPvecUYeuT0iNfYXpz/dGwmEw1n9DE7vatzXPusoJZq8dVT0vuJv18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCVua/8mKl/Z4y1HY6fSnoYpkZ6hpVmJF79SEaf4Z4ovDIs1Fc
 Nix/adxwcCCpFrmJqK/BucEUHO38JhqyfeJiy41NHz6YpBgg1Nc9HS29yvNOH5tSKxXmCKPVGaK
 a+Jf7Hq3C7fZhjDJHg6k+nhnIkLmUsaqu+BQMu8GbnP/vdLrp5cCAyQdsCzEgnXfoyKt0WVc=
X-Gm-Gg: ASbGncv3vch0I2Oi409WMhLxT7anPlRRWfuGzGvU2M+8qxh30+MwVwlUEKWQq2hrzjL
 6WrsC2fqW8a6aQFvB/cpYsvezBvNqltUAXAi4PorRfhVloMhdMvAyeb0RD1iJoIY2C7e//2uIPV
 vMEyaitYDhktEPCIqZUi+GfS2LKtcGwpUr30bf5vxHM4ZAJ+3QIJ+6lmwJz1nVaf02ISPpLtLbZ
 /G4t2CKYctOj0VGRqAlSN7x0oBKMVyPMa6MiyfBd5tabNgCK0OKymJ3gn/6tEcHruPjfurwpzj/
 qwCsYLt7nEAnh2c0nXwiORnVFLC6s/EF4E6q3e9Q90jDpPQZpsetjo7UzfD/BzdnVTwQbtS3/se
 kJmeFWpiRSuNxsuiqZejUA/20GOVxCTcpP+rmYzf2z3xAsiUdcVtG
X-Received: by 2002:a05:622a:1a9d:b0:4b5:e8c2:78d2 with SMTP id
 d75a77b69052e-4b77d077b83mr38580591cf.62.1757676022214; 
 Fri, 12 Sep 2025 04:20:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHg4eYraHClGAC3c6ShRy1LlgD+/KS3l7smN2ljKJZw7h2XFpAAaVAZ2QtQocEx1SbSNnxuA==
X-Received: by 2002:a05:622a:1a9d:b0:4b5:e8c2:78d2 with SMTP id
 d75a77b69052e-4b77d077b83mr38579831cf.62.1757676021505; 
 Fri, 12 Sep 2025 04:20:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e63c63f6csm1074336e87.86.2025.09.12.04.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:20:20 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:20:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Miguel Gazquez <miguel.gazquez@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>, Phong LE <ple@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com,
 kory.maincent@bootlin.com, romain.gantois@bootlin.com, praneeth@ti.com,
 Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH] drm/bridge: ite-it66121: Add drm_connector support
Message-ID: <cqtjavx2aljj34d6rdxysrl3fsmi6i45o6w7gmcul7v3xkws5v@d4sensdcyrfp>
References: <20250909-it66121-fix-v1-1-bc79ca83df17@bootlin.com>
 <do5zciwcanpiciy52zj3nn6igmwlgmbcfdwbibv2ijxm2fif5s@ib6jhzi5h2jo>
 <6164422a-6265-4726-8da5-68bb8eafb9e6@bootlin.com>
 <20250911-innocent-daffodil-macaque-797f13@houat>
 <012046ab-d866-4b3a-8c8a-e130bc2b9628@bootlin.com>
 <2l5kp4ojrcsg2apcpv7mzeeypwynecyfesenks6zzvnst3qkbt@4yhbosy2zhah>
 <e6af5c37-d18a-423e-b822-367441a48f86@bootlin.com>
 <21f80397-be9c-49bd-b814-ea5f0eb5fdc8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21f80397-be9c-49bd-b814-ea5f0eb5fdc8@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXyTK1UxNpfKSo
 /r1MurB1lf+BF9DdO59vv8YJqCd7KRmnVb07CvwUhaPktge5Lp36ICUmYjDOZE6QUWAguZ1blWV
 jSlzZ57anUSDBfbNClYIuXMxsJbbLhM3ebG8yc/v8Tk28Lipyf1fyobJ6iyw+X9BgvWBW39Ziji
 EnOQJC7VGEmmorBZL8n3ousF2z0FMBR+RWF5ZLizh8/u5NIypfxsO5N4jBmNxzRbzDTa2tLwk9c
 p0Hxb3cznKhi7+R5kSutj/h6+Q+k8T143sUFZXh/84LAb3jMuS0cKxo2LnHth0T7J8qbzcF7Yoz
 +mIKa8EcrI3acW4u+E4Lr9nQwKHa3DQT9cRkq+9NIDtAGau4a3Wv2nqARrA3X2RANvwVnjneKG8
 Mq5pEQER
X-Proofpoint-ORIG-GUID: gLLlysC1wokU4dXQTvnc4dT887_BLXcZ
X-Proofpoint-GUID: gLLlysC1wokU4dXQTvnc4dT887_BLXcZ
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c401f7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=sozttTNsAAAA:8 a=046QJsDkA4Zp6KAU2jsA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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

On Thu, Sep 11, 2025 at 05:47:57PM +0200, Miguel Gazquez wrote:
> 
> 
> Le 11/09/2025 à 17:40, Miguel Gazquez a écrit :
> > 
> > 
> > Le 11/09/2025 à 15:09, Dmitry Baryshkov a écrit :
> > > On Thu, Sep 11, 2025 at 02:49:59PM +0200, Miguel Gazquez wrote:
> > > > 
> > > > 
> > > > Le 11/09/2025 à 11:50, Maxime Ripard a écrit :
> > > > > On Thu, Sep 11, 2025 at 10:51:06AM +0200, Miguel Gazquez wrote:
> > > > > > 
> > > > > > 
> > > > > > Le 10/09/2025 à 04:28, Dmitry Baryshkov a écrit :
> > > > > > > On Tue, Sep 09, 2025 at 06:16:43PM +0200, Miguel Gazquez wrote:
> > > > > > > > From: Aradhya Bhatia <a-bhatia1@ti.com>
> > > > > > > > 
> > > > > > > > Add support for DRM connector and make the driver support the older
> > > > > > > > format of attaching connectors onto the encoder->bridge->connector
> > > > > > > > chain.
> > > > > > > > This makes the driver compatible with display controller that only
> > > > > > > > supports the old format.
> > > > > > > > 
> > > > > > > > [Miguel Gazquez: Rebased + made driver work with or without
> > > > > > > > DRM_BRIDGE_ATTACH_NO_CONNECTOR]
> > > > > > > 
> > > > > > > What is the use case for not using DRM_BRIDGE_ATTACH_NO_CONNECTOR?
> > > > > > 
> > > > > > Some display controller drivers (like the tilcdc) call
> > > > > > drm_bridge_attach
> > > > > > without DRM_BRIDGE_ATTACH_NO_CONNECTOR, so the bridge
> > > > > > must support both with
> > > > > > and without DRM_BRIDGE_ATTACH_NO_CONNECTOR to be
> > > > > > compatible with all display
> > > > > > controllers.
> > > > > 
> > > > > I'd rather convert tilcdc to use DRM_BRIDGE_ATTACH_NO_CONNECTOR then.
> > > > 
> > > > The problem is that doing that break devicetrees using the tilcdc and a
> > > > bridge who doesn't support DRM_BRIDGE_ATTACH_NO_CONNECTOR (there are
> > > > multiple bridges that don't support
> > > > DRM_BRIDGE_ATTACH_NO_CONNECTOR), and if
> > > > my understanding is correct breaking devicetrees is not allowed.
> > > 
> > > How does it break devicetree? The drm_bridge_connector isn't a part of
> > > DT.
> > 
> > 
> > In the current situation, a board could have the tilcdc linked with a
> > bridge that does not support DRM_BRIDGE_ATTACH_NO_CONNECTOR (for
> > example, the analogix-anx6345) , and everything will work fine.
> > If we convert the tilcdc to always use DRM_BRIDGE_ATTACH_NO_CONNECTOR,
> > that same configuration will stop working.
> > 
> > When I said "breaking devicetree" I meant that a devicetree describing
> > this setup would no longer produce a working system, not that the DT
> > files or bindings themselves are incorrect.
> > I didn't find any upstream dts with this configuration, but maybe there
> > is some out-of-tree dts which would be affected.
> > As far as I understand, we should avoid that.
> > 
> 
> If I can rephrase myself, is my understanding correct ? Do we care about
> breaking out-of-tree dts ?

From my practice: only in a very limited way, if there are well-known
out-of-tree DTS (e.g. we kept some bits and pieces of panel code because
of out-of-tree ChromeBook devices).

But you can easility keep compatibility: inside the ticldc driver first
try attaching the bridge with the flag set, then, if it fails, try
attaching without the flag. Add dev_warn() and some grace period.
his was the path that we used to migrate the drm/msm/dsi: enable
DRM_BRIDGE_ATTACH_NO_CONNECTOR by default, keeping legacy support in
place, then drop legacy after some time after converting all users.

-- 
With best wishes
Dmitry
