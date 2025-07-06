Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600B0AFA4CA
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 13:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48A210E27C;
	Sun,  6 Jul 2025 11:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSD0Jd/x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3724710E27C
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 11:40:35 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566BK2bS006848
 for <dri-devel@lists.freedesktop.org>; Sun, 6 Jul 2025 11:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5MtJrLZB6vHEJTFAbODLQrWnKEyq1v38Cox+teZzaIw=; b=PSD0Jd/xscPweOes
 JKoYB8n19FNdfRSiO+HjGlfENKg3f1EfK15Q2LeILY3I5C96fOI1IyUrg2WnOaS1
 h5uYNvoXmqSpnUbHhoue+LYrr5jRRTebj97epteWV/2hZwchSrHRi5C3YPqlZb12
 cxL9KzsxQU7JHmCNtIjuoU7tM251/G4DU02wQFtTGoZldTb8y/2ZewGeCTLNDEHo
 HV8QSgeItBsBoPwSFxnE5WJzuyF9zhmpfInvP3yG8C4aqvZSbQ0yGG96EgeK9YKU
 0HomfQO+hboqIX8CjD4NZTGKrYNz5us1os8o7BFjL7UxfXxxVNqlfc/OvQI6eQFd
 B3GxHw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q3k35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 11:40:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fb5f70b93bso36290876d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 04:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751802033; x=1752406833;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5MtJrLZB6vHEJTFAbODLQrWnKEyq1v38Cox+teZzaIw=;
 b=Kmg9VCp82pWBkMM37ZZFtzRAzr1KpkJz7YoMlv+E278IpldGMad7z/LswzZlywnCOy
 eQU3TTzRIMSpj85jIMtUrenVqdnOLT4S7BlLviOqVBFOXk+dkigjzs31atBjgLSAItwn
 yZzqxZKV8C9LkLvO381xI/WeR4A7kUZ9+BcQBnFz7wJyJ8AJ77DDVBXWuisTpBBuj8OH
 hczWmv1wdyinC2J0Luyx5DYpDh7Nj2GsqVbiZwjHdlcUa7/6tmsrjC6L/Rz7FtyZvZ7A
 c2N+slze2L73s2lqWiWmbLJxMDYrLXY8O5KScfvDpGMRvuzFeB7QXMWQBlSTeJFLkHxL
 tMAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6k0N0kIoyMQPlo4Ed/w+Hxyr1bsEtJ1CbsVwlusoU2oyfD/iEMKM8YtSruBVtDaki47lp2YrmOlM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1/rWSeqYzkYYkDpuJBjWsJ1QFx8MLbGTRFUUMkKhbbjuN0/uT
 3ZVNKVyco62b4NcrE92+wDPkZje42usGoao+rDeG9kR7+xNCJbl+zqDsefJMdjh2jFqwvbQ5Wes
 25liselVACGxjcbMf6SLItUMdL7WvdNWKpMe0ryxxLk+JnQkYFpS1gyrNoGiREA++f2SlFXw=
X-Gm-Gg: ASbGncue7npnaces2e6gKZ4oot45ofAAtnbe7temXOQ59s0NNLxAzd21th54jocfKO1
 eyjYrQpXezIZhTdFmLVNHllgat3KiYOf/upkWqGwbbRm/uFTFeYH2DWA01vb3ZcFi93zlDIZ1Ew
 3slvqpm99m9iohP62VF8kx9B5TLRZQO3tgBtAnJRjmiwENtOOyWvIxc8S/9pNa/IZdUn/NBGMGd
 kkjrSgMQEvQmX1OwEMW6aoYA+VjEepNIhUTey4ZkW5novZ/K2KVVcHGysjf5vvXlbWK0NIWclbI
 r46lX47ZWV6g1HvWQTzK455Y234iMrMjilEZdVpRmgyPISqwkD9JbQ2RUovCDS08/MlqZMlPHmB
 TCDDLoAChcbtgjvnwP//dnciHLP4WbfIP7Dg=
X-Received: by 2002:a05:620a:408d:b0:7d2:266b:bbd with SMTP id
 af79cd13be357-7d5ec391bb3mr714977985a.0.1751802032843; 
 Sun, 06 Jul 2025 04:40:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3g/38GUwEKc9hX+7DDN51fyxCqyBjPwsxwNJfsOPjbCkjHwKMndS8pl0pRpR8GdpwIqeFOA==
X-Received: by 2002:a05:620a:408d:b0:7d2:266b:bbd with SMTP id
 af79cd13be357-7d5ec391bb3mr714972185a.0.1751802032262; 
 Sun, 06 Jul 2025 04:40:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384d5982sm922287e87.258.2025.07.06.04.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 04:40:31 -0700 (PDT)
Date: Sun, 6 Jul 2025 14:40:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Maxime Ripard <mripard@kernel.org>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 dri-devel@lists.freedesktop.org, lumag@kernel.org,
 Laurent.pinchart@ideasonboard.com, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH] drm/bridge: anx7625: Fix invalid EDID size
Message-ID: <gx2jle4h4wf4nszsbmkzibzhjctwx3ifpyj3ar6ullsora725n@2ei2g775b4iv>
References: <20250629023836.744441-1-loic.poulain@oss.qualcomm.com>
 <20250630-venomous-sheep-of-control-dece32@houat>
 <CAFEp6-3UVNfHo3s1MOXw88bAMVh=3QzF7H2N2UoVXyV6R3BBpw@mail.gmail.com>
 <20250630-angelic-macaque-of-spirit-fadc59@houat>
 <CAFEp6-2N4G0J+Fmke369t7zsnHDpi4zPuRx_Xn-hXAWN7URoJA@mail.gmail.com>
 <77a6722549f3bb5d5e22a11762bf55bf16935e85@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77a6722549f3bb5d5e22a11762bf55bf16935e85@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA3MyBTYWx0ZWRfX8QT/fUP4yTcJ
 ZeVPngat6Ju65YHzrCBiJmQDp/Jb4RrIQmrj7dpsotCRjLxri8wNFTsOksigXMCpgmh6B9F5W6i
 DONhqVjK6wO3WoxtVPTNAd2CrrH98dcrwUyEu8sZmwrENS6W2sUGjkmg7FADogWHM4ldOkPgqp3
 vhhjg40X97MJY2n9tgT1fp9P+P++aOX58eFBx24T0DDfO1pSOe4I1NrxTRaF1sL263R0BBOL4xO
 5L+8GALzl0jMTvClWsk24W7dd0VM/YOJLCmnU04evsXK2BACg62hyZu4ABqNyV5BY2DcCnpa6ei
 J3g4HswxEEXMRbzZHHPaUpwrhTl/1PsIescrlqNg6rTU4QFLv6fAnVMqTP8vqDoGMszTjbbzH8F
 OMmGVESd2sFXrk5Civ2/mUxWb7P6zRmKVZHcQjwCOlFcouIDT4ImMbxu8BouMhQl/Bde8FUW
X-Proofpoint-GUID: 9Qcva-KU5hovzvaYj6xblymTmhcy9m1Q
X-Proofpoint-ORIG-GUID: 9Qcva-KU5hovzvaYj6xblymTmhcy9m1Q
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686a60b2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=hlEkV9Rg_N19d2oT19MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060073
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

On Tue, Jul 01, 2025 at 11:56:23AM +0300, Jani Nikula wrote:
> On Tue, 01 Jul 2025, Loic Poulain <loic.poulain@oss.qualcomm.com> wrote:
> > On Mon, Jun 30, 2025 at 10:40 AM Maxime Ripard <mripard@kernel.org> wrote:
> >>
> >> On Mon, Jun 30, 2025 at 09:46:40AM +0200, Loic Poulain wrote:
> >> > Hi Maxime,
> >> >
> >> > On Mon, Jun 30, 2025 at 9:07 AM Maxime Ripard <mripard@kernel.org> wrote:
> >> > > On Sun, Jun 29, 2025 at 04:38:36AM +0200, Loic Poulain wrote:
> >> > > > DRM checks EDID block count against allocated size in drm_edid_valid
> >> > > > function. We have to allocate the right EDID size instead of the max
> >> > > > size to prevent the EDID to be reported as invalid.
> >> > > >
> >> > > > Fixes: 7c585f9a71aa ("drm/bridge: anx7625: use struct drm_edid more")
> >> > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >> > > > ---
> >> > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
> >> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> > > >
> >> > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> > > > index 8a9079c2ed5c..5a81d1bfc815 100644
> >> > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> > > > @@ -1801,7 +1801,7 @@ static const struct drm_edid *anx7625_edid_read(struct anx7625_data *ctx)
> >> > > >               return NULL;
> >> > > >       }
> >> > > >
> >> > > > -     ctx->cached_drm_edid = drm_edid_alloc(edid_buf, FOUR_BLOCK_SIZE);
> >> > > > +     ctx->cached_drm_edid = drm_edid_alloc(edid_buf, edid_num * ONE_BLOCK_SIZE);
> >> > > >       kfree(edid_buf);
> >> > >
> >> > > Do we need to cache the whole EDIDs? AFAIU, it's only ever used to get
> >> > > the manufacturer name, which fits into a u32 / 4 u8. We should probably
> >> > > just cache that.
> >> >
> >> > While the cached EDID is indeed used internally to retrieve the
> >> > product ID, its content is also returned via the DRM read_edid
> >> > callback. This value is then used by the DRM core to enumerate
> >> > available display modes, and likely also when reading EDID from sysfs.
> >>
> >> You still don't need to allocate and store a copy of the EDIDs in your
> >> driver to implement what you listed so far.
> >
> > Right, we could change how the driver behaves on callback and just
> > cache what we need for internal usage. That change was initially a
> > pure fix, do you recommend changing all of this in this change, or in
> > a follow-up one.
> 
> If there's a follow-up, I really *really* think it should be to rewrite
> EDID reading in anx7625.c altogether. The current thing is busted in
> more ways than I have time to enumerate right now. And it's not because
> I'm in a huge rush. Just look at sp_tx_edid_read() and the functions it
> calls.
> 
> The end result should be based on providing a straightforward read_block
> callback for drm_edid_read_custom().
> 
> I've actually started this a few times myself, but it's a bit much for
> someone without the hardware to test it, nor skin in the game. The
> current code is too complex to trivially refactor.

It feels like it should be dropped completely in favour of the DDC
implementation provided by drm_dp_aux_*(). I'm not sure why the driver
implements I2C reading on its own.

-- 
With best wishes
Dmitry
