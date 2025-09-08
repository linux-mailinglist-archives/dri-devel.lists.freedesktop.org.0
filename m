Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BB4B489DD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 12:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF4610E124;
	Mon,  8 Sep 2025 10:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rt9J+HC+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7192910E124
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 10:17:42 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888xHGJ031748
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 10:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vCjXnZfE2tyLur7FXPpdd2CNC2hDwBx1MMn09lIuguo=; b=Rt9J+HC+2/l2eMqf
 4IUK2oNS682Q6nrpSmvdnMNpGjsizL+7vBLI98Gxe/CNdyBUlqxy7XWLfAqtQOfS
 iDtk3qAYM5N7j+TIPUTdiogqCcNgIDGND/baDOXPbIWJ1BQ9dRhhJbMsyIlNyWey
 c/wyp/QqpAPk/tJckm8MEM5JKywpLkN3hpZCjyui+7EwRMs0Hf7HkwSqmiJEtGts
 dUNBWUWcd61VfxUHQ6A3hClkQbkptilRTDtrAyGD9GGpBsCR4DhiVycdx9r5f1Yr
 L7J6DyrbomJu7MPDRPUUnAd4ZKIgNAPSh5Bw3TqTc5Oo9azPv00YzrzPAba/cKDs
 hUGF9Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a444p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 10:17:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-7296c012f86so88117126d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 03:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757326660; x=1757931460;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vCjXnZfE2tyLur7FXPpdd2CNC2hDwBx1MMn09lIuguo=;
 b=DMUjV7By0AkLoc3s9CduJJBZyqnhjXiVfF1NqLeRIVWi++ZGcVMHtqGYRFvoVJfwez
 8Zev4MiF6LUMeVFc5y01VoCyIJiWASP1ZNPr0GV5i7u2C8GYBvcMhFo4mygECTHnR31D
 gX55+H4Ov6xl2LFOOBnm7ZSgwtdvp1paFMUgD7uxshq71woHzHIAMVhGR53AQf5cROml
 E6vvVTOQb6sV6zSO5hkhaYiK2jpCSgOucc1DaH5Htbott7jvDmxycU7q9JbpXFQ/FuGg
 UbRj/X3LLQ1NH0HgEzFzMb7Cda1lY1Arp7Fbxp/3gifPPTRbfItTLv5dduM36ni+BMR+
 TeZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtB/xQ8p7z8HIS0s2rKVumTJLNsL0Aba+TVkHnpX/0jA8AIMPtWPkiML79con1AFNRrHnAKz1zL0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpNS1IhhrDrQHLVH8RswGJOnF/EPCoUFSJSsYdWeLa76urwB/T
 NMge57+W75GpQi12wieUSagMFl5OSQD4M4bihgDfTwV8fgeRynoq8cJdBA6JviE0Fur8ce6FAXT
 ymrEh46WeFmpTaZj4HMoE7Ev2izyGK8sJs3W+LZDCT5TI37krfTVCv+U4qE2efdzfGWV/MTY=
X-Gm-Gg: ASbGncs5gmNLtZBucFxhxqWaxEEbNlZOmTzggArb+vxVpfuBQKbVHjAnwVuV5WDPRMw
 dDf2HjoQfz0OiuskifkaCg5MxmWYg/vi5zKdn5JI7OUf2vYo6cz9nk9aDOWplPcmzjMCXoPUAvj
 c6Tb+WyE68L3ElFCCIi/WmYKE3qckJzOfbQMsOktWZ48McRiDrPO70NR2pRfCH1WpHit8u0M0W+
 X7Xfa3IsEACVwJHL0pE4bopTIEPaWzstjC3/f8tyT/dbtZwX9q9xuH2GhtRixpLWnq+3flRi0Lz
 CZH660EdBSi66NpxTkXfP/liC7bcUkTlhoEY4LiXDd/b61dE7y2Q8Ua8V5WDzD+RQJy13X3jvkm
 WA6/98kJW9Sp8S8d+jd4Wvx+9DgQN/wFQexeuBQupj4IzIa1vWXBA
X-Received: by 2002:a05:6214:268e:b0:71c:261e:54ba with SMTP id
 6a1803df08f44-73921b4fd8fmr78452576d6.27.1757326660269; 
 Mon, 08 Sep 2025 03:17:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXC4iVA1vMcsCtHF5DkIPqNh5JMkSdSnysesnslOPC68kcKK7iwzOJZg6GK+/J/kIv3DHUYA==
X-Received: by 2002:a05:6214:268e:b0:71c:261e:54ba with SMTP id
 6a1803df08f44-73921b4fd8fmr78452136d6.27.1757326659568; 
 Mon, 08 Sep 2025 03:17:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50b0901sm31248111fa.59.2025.09.08.03.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:17:38 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:17:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, syyang <syyang@lontium.com>,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 xmzhu@lontium.com, llzhang@lontium.com, rlyu@lontium.com,
 xbpeng@lontium.com
Subject: Re: [PATCH v1 2/2] This patch adds a new DRM bridge driver for the
 Lontium LT9611C chip.
Message-ID: <x3g4qxksghteg4tcv6vmuaoie3c6lh3gkjsfwj2qn4lvim6o6t@hrjtunavnedj>
References: <20250903123825.1721443-1-syyang@lontium.com>
 <20250903123825.1721443-3-syyang@lontium.com>
 <24rahlm4kkob7knapdxxnjixye3khx3nv2425y4kkirat4lmam@gjey7zqsnzks>
 <CAFQXuNZUfAJe4QEDfi+-1N99xO0_z5_Omnsn_-SXr2QPtvdL_g@mail.gmail.com>
 <7cyypk5j7o5fglmibshg45iysffpdl75m6rqvv4b5zntfevhiz@zlt7ybuzkvrg>
 <CAFQXuNb+Eq6KPFvsnmGvn7KKjn4WRtMy1x4pn4ZvZoQ-_S_fYQ@mail.gmail.com>
 <d3e3b838-26fa-491e-8c4f-63a1693f2391@linaro.org>
 <CAFQXuNbZfnySYmizY2=PJGLkk38WHOYbVcbPTRZvgY7bFdK8yg@mail.gmail.com>
 <zv7twvfxlira5wmg4zwk6kgkldgdiesgqzjky4733lp2us2hmx@tohls6czl3wz>
 <CAFQXuNa7z=RHtbx6zrtGGDK4dpa++m_BPxTNj8iemLkxYPP_zA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFQXuNa7z=RHtbx6zrtGGDK4dpa++m_BPxTNj8iemLkxYPP_zA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68bead45 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Fy06R7qyhczz9_k_:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=vWrx5uKgKmi_-Q7riJMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YISIJV32AyOH40XQfnwJXRFC04YCcImh
X-Proofpoint-ORIG-GUID: YISIJV32AyOH40XQfnwJXRFC04YCcImh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX9OM3cLCUiN/0
 bFlDZwVt5gemaUgeA6uMRxa+JLL0J0b7/UrQgSEKzpEL0qB0QyiQ+eKSr5CPdyyRi/AasqfdS7E
 NVwDeVDK0SZ0nfa6OKOih684wtVsCuG4qkLZ4NGOAQcCp/HNYf42kVOS1jJhdvc/KJmtVlctfUo
 fMt1qFSZnb+y0PzLZjsxlPCNPCtEBA/kqhZ1GJNTq/y4UoeYOHQ/ArTJZYgogimxgfg4IEp5zzU
 A6P8BEHCWcJKWGleZ8Hr/jfquANgLnyNNx5aJa1gd1+P+fiDhU4e9Lcrz/r2xSxrkz3TcLFfT4e
 4c+A5PhUlNLSLZJBr1PVgn/jutTxB6CGP+b3bpVf3quIr2yxxtkTLBsvDM5tH2wWr8exe0sVmhg
 pBDgOUhV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

On Mon, Sep 08, 2025 at 09:14:51AM +0800, 杨孙运 wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年9月5日周五 22:24写道：
> >
> > On Fri, Sep 05, 2025 at 04:58:59PM +0800, 杨孙运 wrote:
> > > HI，
> > >
> > > As a vendors , we have begun to attempt to contribute to the Linux,
> > > and we are very willing to do so.
> > > there are still many rules that we don't understand and need to learn.
> >
> > Not top-posting and trimming your emails would be nice things to learn
> > too.
> >
> > > <neil.armstrong@linaro.org> 于2025年9月5日周五 16:10写道：
> > > > On 05/09/2025 04:55, 杨孙运 wrote:
> > > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年9月4日周四 22:39写道：
> > > > >> On Thu, Sep 04, 2025 at 06:48:13PM +0800, 杨孙运 wrote:
> > > > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年9月4日周四 10:52写道：
> > > > >>>> On Wed, Sep 03, 2025 at 05:38:25AM -0700, syyang wrote:
> >
> > > > >>>>> +     }
> > > > >>>>> +
> > > > >>>>> +     if (lt9611c->bridge_added) {
> > > > >>>>> +             drm_bridge_remove(&lt9611c->bridge);
> > > > >>>>> +             lt9611c->bridge_added = false;
> > > > >>>>> +             dev_err(dev, "DRM bridge removed\n");
> > > > >>>>> +     }
> > > > >>>>> +
> > > > >>>>> +     if (lt9611c->regulators_enabled) {
> > > > >>>>> +             regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
> > > > >>>>> +             lt9611c->regulators_enabled = false;
> > > > >>>>> +             dev_err(dev, "regulators disabled\n");
> > > > >>>>> +     }
> > > > >>>>> +
> > > > >>>>> +     if (lt9611c->audio_pdev)
> > > > >>>>> +             lt9611c_audio_exit(lt9611c);
> > > > >>>>> +
> > > > >>>>> +     if (lt9611c->fw) {
> > > > >>>>
> > > > >>>> You definitely don't need firmware when the bridge is up and running.
> > > > >>>>
> > > > >>> The previous text has already described the working logic of the firmware.
> > > > >>
> > > > >> It's another topic: you are storing the firmware in memory while the
> > > > >> driver is bound. It's not necessary. You can release it after updating
> > > > >> it on the chip.
> > > > >>
> > > > > I understand what you mean.
> > > > > Based on the above conversation, your intention is that when the
> > > > > customer needs to upgrade the firmware, they should modify the
> > > > > comparison conditions of the version, then compile and burn the
> > > > > kernel, and then perform the firmware upgrade, just like the LT9611UXC
> > > > > driver. Instead of loading the firmware every time.
> > > > > My design intention is to avoid the need for recompiling the driver
> > > > > when upgrading. Instead, a file named "LT9611C.bin" can be directly
> > > > > sent to the "/lib/firmware" directory via scp. Then you can either
> > > > > perform a reboot for the upgrade or execute the command manually for
> > > > > the upgrade.
> > > > > Perhaps you are suggesting that we could follow the design approach of
> > > > > the LT9611UXC driver?
> > > >
> > > > Yes no need to rebuild, just use sysfs to trigger an update.
> > > >
> > > I think you haven't attempted to understand the intention behind my design.
> > >
> > > If during the debugging process, the customer discovers that a certain
> > > parameter in the chip's firmware is not suitable for the current
> > > situation, then he requests a perfect firmware from our company to be
> > > updated onto the chip.
> >
> > That's fine.
> >
> > >
> > > When there are hundreds or tens of thousands of devices that need to
> > > be updated, simply use sysfs to trigger the update. It is a very bad
> > > thing.
> >
> > Delivering updates to devices it off-topic here. You can use SWUpdate,
> > Mender or any other system to deliver updates and to trigger the
> > firmware reflash afterwards.
> >
> > > If you want to use version number comparison as the upgrade condition
> > > like in lt9611uxc.c, then the customer will need to modify the version
> > > number comparison condition and rebuild the driver. This method is not
> > > as simple as the one I have designed.
> >
> > Well, no. If there is a firmware update, it should be shared to
> > linux-firmware and then everybody can benefit from it.
> >
> > Think about one company using your chip in their SoM or compute module
> > and then another company integrating that module into their design?
> > Who will contact you? Or a company selling devkits with your chip.
> >
> > Having per-customer firmware is a nightmare for developers and for
> > integrators.
> >
> 
> We are a company that sells our own developed chips. After other
> platform design companies purchase our chips, they will design their
> platforms based on the hardware schematic of our chips. During this
> process, they must contact us. We will communicate about the design
> opinions of the platform, the configuration of parameters, and the use
> of custom firmware. We cannot provide a common firmware. This is
> determined by the characteristics of the chips.

We are getting off-topic here, but this model has issues as the platform
design company might be completely different from the company that ends
up (re)using the platform in their products.

Anyway, I'm looking forward to reviewing the next iteration of the
driver. It is really appreciated when chip vendors work on the drivers
for their chips.

-- 
With best wishes
Dmitry
