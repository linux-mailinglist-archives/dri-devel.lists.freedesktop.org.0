Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ACB67B24D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 13:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF5310E7A7;
	Wed, 25 Jan 2023 12:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00A710E715
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 05:46:31 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230125054629epoutp0446a8263d63e0ba4819ce6ea22bef685f~9dxnn6XOc2271222712epoutp04M
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 05:46:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230125054629epoutp0446a8263d63e0ba4819ce6ea22bef685f~9dxnn6XOc2271222712epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1674625589;
 bh=NEwNm/LwY6eOUXbJxfSdsnrHPfYhWSnwXjX0rr9rmhU=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=RhPMlKHU+owlp3B3G2FfLUkxn5TDNnAyPFZOU7JAEPMwSRPb2cwMeYmTB/VDdxRjJ
 upRNM+SM/ROBKOUjklq4cQbk+6ckA/iq8+5F9U/155Qlt2zbDSsND8BT3lYgh9+Uv7
 WRDpkBPd3aW1RSUEnpm8yTBmxLaOKYNejrbcOvh8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20230125054628epcas1p4f84952b2c9ef9b88d805454a009cf28c~9dxnCntqR3064130641epcas1p4C;
 Wed, 25 Jan 2023 05:46:28 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.36.136]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4P1tBD0431z4x9Q2; Wed, 25 Jan
 2023 05:46:28 +0000 (GMT)
X-AuditID: b6c32a38-39fff70000029402-00-63d0c2328958
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 32.3A.37890.232C0D36; Wed, 25 Jan 2023 14:46:26 +0900 (KST)
Mime-Version: 1.0
Subject: RE: Re: [PATCH] PM / devfreq: Fix build issues with devfreq disabled
From: MyungJoo Ham <myungjoo.ham@samsung.com>
To: Rob Clark <robdclark@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <CAF6AEGud-ESF=VgcaSFzKsWas0H5eSXZDdZGcnd8Ju=pr-W2EQ@mail.gmail.com>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230125054626epcms1p38d34dc65cbc9cb29dd707a4b2cac8fb4@epcms1p3>
Date: Wed, 25 Jan 2023 14:46:26 +0900
X-CMS-MailID: 20230125054626epcms1p38d34dc65cbc9cb29dd707a4b2cac8fb4
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAJsWRmVeSWpSXmKPExsWy7bCmnq7RoQvJBq9XqVtc//Kc1eLK1/ds
 FnOen2W0OH9+A7vF2aY37BaXd81hs/jce4TRYstqe4trPx8zWzxf+IPZgctjdsNFFo+ds+6y
 e2xa1cnmcb/7OJNH35ZVjB6fN8kFsEVl22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpa
 WpgrKeQl5qbaKrn4BOi6ZeYAXaakUJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAt
 0CtOzC0uzUvXy0stsTI0MDAyBSpMyM54dHoRe8E+7ooPe7+yNjDu5uxi5OSQEDCRaHlxirGL
 kYtDSGAHo0Tn2rcsXYwcHLwCghJ/dwiD1AgL+EtMWdzCBGILCShJNNzcxwwR15foeLCNEcRm
 E9CV2LrhLguILSLgKTFt33p2kJnMAj3MElc6jzJBLOOVmNH+lAXClpbYvnwrWDOnQKDEj7Wt
 7BBxUYmbq9/C2e+PzWeEsEUkWu+dZYawBSUe/NwNFZeSeLJzMhvIMgmByYwSJ08cZ4Rw5jBK
 TNvwjg2iSl/izNyTYDavgK/EgrsPWEG+ZBFQlZj5GGqZi8TX3mlgQ5kF5CW2v53DDFLCLKAp
 sX6XPkSYT+Ld1x5WmF92zHsC9ZeaxKHdS6DGyEicnr4Q6k4PiV9bX7JDAreXSWLVlqMsExjl
 ZyHCdxaSbbMQti1gZF7FKJZaUJybnlpsWGACj9Lk/NxNjOCkqWWxg3Hu2w96hxiZOBgPMUpw
 MCuJ8PbMPp8sxJuSWFmVWpQfX1Sak1p8iNEU6M2JzFKiyfnAtJ1XEm9oYmlgYmZkbGJhaGao
 JM4rbnsyWUggPbEkNTs1tSC1CKaPiYNTqoHJT3v1Gd7eGzfPO/q8MirN3zanzMFNcM3x/54L
 nbi6S2Uq9qWsjzjKuSn6y4aG921T3lY8dTx1pXnfnOmpJW57/Yz+COz6J3s91Nzuun3hfacd
 J5qF/H69aWp4ZZZ29aStp1CBW/WJRP9Qr4V1iomG3y7sevO0rtSnPeJo7oGVTjJxs5oNPupm
 3T90WW2p9u7u6MNB1ydW82WLFWxK9D+7KkbigrWb0Mcd4ZHPuTg3nplQduJVXeD/Y0GNQi8E
 v2pdEFhwi7NRN+90bOK6TQ+eJsvbOS12OLRqYfvTuVyGqgbumx+8uRsU7nyPf8drL+ezN3u9
 ba9ZMxa0ngiPltT7XOa782/nI946HjeFLSFKLMUZiYZazEXFiQDi5e2cIwQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230123153745epcas1p17e57cf83ed371e86258139473befc615
References: <CAF6AEGud-ESF=VgcaSFzKsWas0H5eSXZDdZGcnd8Ju=pr-W2EQ@mail.gmail.com>
 <20230123153745.3185032-1-robdclark@gmail.com>
 <20230125040403epcms1p1646e9668b87df3e9c344ad58d39b6eb6@epcms1p1>
 <CGME20230123153745epcas1p17e57cf83ed371e86258139473befc615@epcms1p3>
X-Mailman-Approved-At: Wed, 25 Jan 2023 12:06:41 +0000
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
Reply-To: myungjoo.ham@samsung.com
Cc: Rob Clark <robdclark@chromium.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>On Tue, Jan 24, 2023 at 8:04 PM MyungJoo Ham <myungjoo.ham@samsung.com> wrote:
>>
>> >Sender : Rob Clark <robdclark@gmail.com>
>> >Date : 2023-01-24 00:37 (GMT+9)
>> >Title : [PATCH] PM / devfreq: Fix build issues with devfreq disabled
>> >
>> >From: Rob Clark <robdclark@chromium.org>
>> >
>> >The existing no-op shims for when PM_DEVFREQ (or an individual governor)
>> >only do half the job.  The governor specific config/tuning structs need
>> >to be available to avoid compile errors in drivers using devfreq.
>> >
>> >Fixes: 6563f60f14cb ("drm/msm/gpu: Add devfreq tuning debugfs")
>> >Signed-off-by: Rob Clark <robdclark@chromium.org>
>>
>> Doesn't this imply that DRM_MSM should depend on PM_DEVFREQ ?
>>
>> It appears that gpu/drm/msm/DRM_MSM uses PM_DEVFREQ without actually
>> declaring the dependency on PM_DEVFREQ.
>> You cannot use SIMPLE_ONDEMAND without DEVFREQ.
>
>Possibly that would resolve some issues, and that might have been my
>mistake in assuming that depending on SIMPLE_ONDEMAND implied a
>dependency on DEFREQ (which seems like a reasonable assumption, IMHO)
>
>But AFAICT some kernel configs that could otherwise use DRM_MSM don't
>support PM_DEVFREQ.. either way, lets solve this properly and remove
>needless dependencies on devfreq.
>
>BR,
>-R

Ok. You are enabling struct and enum only and that looks harmless.

PTAL, Chanwoo.

Acked-by: MyungJoo Ham <myungjoo.ham@samsung.com>

Cheers,
MyungJoo.
