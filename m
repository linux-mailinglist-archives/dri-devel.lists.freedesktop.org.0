Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659DDB576EC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B263A10E2C9;
	Mon, 15 Sep 2025 10:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hA//YARD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DDC10E2C9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:46:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8Ff8q027131
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9irzidGnPklIqadICWqVzQD1xs6oY5hHVIDkW0mt/jE=; b=hA//YARDmAVjrEnt
 jKIjGIn0hPD5Jgi4kwFha3Qvj2BSzFhY2VGOcXQdVKkBibESN8IVcMXwx03JUaqW
 JDjIvS7Gqle88Pr0fEdNlr28ZHxTsBA7xVRPSTMI25O0ldoTmuQIKhHWvp0vUlgx
 31nZcBM9TDHKpycCrTECxQET0kekOLf1jx6f3p1bkmipRoiPLYwI+l0XWuh/gl7J
 vG2KqB2spTiEB+OszgvQtNuqLOuaYGlBN3Fl6xh6HXpPH8GHTaabdqSXD+WN2EiS
 l9vK1zjTJEurRrUAzFkD6ls5mvBKcSfCjQNuADRAlzq13r8uNjl35ipPI1kUGhk7
 lFdCjQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072mm35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:46:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b793b04fe0so37415221cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 03:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757933186; x=1758537986;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9irzidGnPklIqadICWqVzQD1xs6oY5hHVIDkW0mt/jE=;
 b=NsVDiXSzEHpDXm3vcMmphE9pGBA8/dYsUnkVKz0l+nBxff74EBMPJGEE0/SgPZJ+1h
 6cqI6rZ/AIoQbOqlnN9uJbafYQ+qzXsiwU2uIojhpos6XYzOUEM1xHo1L2AWnGuVcnmy
 C40fVvLibT1+L7jzkIxPEKf6UI6+JTep43oqdFCQ/izAhcEEvzIOOKodJBuNxyw1wYsE
 so/SoWtWal1CRWyCPP78AQZdBkr3vWQoL1DgRTX5vc2CGwQYT+fXXMOA34OAfjyKn/4h
 NQUaaKK5/TNuLitteCO5arFA3yks2oq0sGdmCkzWvP55vmi61UAU078zIdRS7nuyqZuo
 qd7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaazpxkvxPvLtfj6UxRSYblkyfPsAOknLZ2zN7ZScHqA15/jF36eX0C81mymPx89d85TbC0RJp2qk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzl2yriS3fh2mfh4oWipsraTpdR+bxV7OYz3p2xJR42+Ct8hmfV
 jNRrl52fEdGkiOggbb7d5xuZneLEv3zA7cJA2ii89MMRrPbq1PDOfRwG1mYHNuYWhgqg/a5EaYK
 qKQqtjmERhC2XsiDhTgIwOxg/CcgKPQY/IH0XUT1dGjBgoQuQNyUFwI8S+EpOiyA7N0+hAz0=
X-Gm-Gg: ASbGncuIPf8z0HwtKw5iQqF6DBaj+3spwwD1guXwTMCUA1FqjL2IEKb7Iowc8zBOsJz
 mgmLt9KVQEzzjkjOp5nFDk7Sc6wKPAcPNjl7+gPh8E1zlZDm7iFNEKDRxkuQ0ht2r9rkqx9Ypi1
 nbVVud99EenZGgjDuILq+Valu3vtZ6tTdOT0ASnrZnwDBPIl07Od5j82me9OhIHB8nvs/iGYqQo
 G4Zkf67ZTFC2Pcy+gax51FvDqI2y3xHRh9ycc/E/4n6I0MTwfMV/3/Fkg3oerYvPJYI3czTSpzA
 sZUcneBMgSSoUmRT9ufHFBsyP5Gbj0fI/XepCAG+9YhWpqrtqdwYyB+xivcnHI5dKbna8Q2uGpD
 Graw2iOdu97CcsCwfrpsvE8gdNMGAuuErrXDp46AIvyzrae8l0WGN
X-Received: by 2002:ac8:5909:0:b0:4b5:d932:15c2 with SMTP id
 d75a77b69052e-4b77cfd7ea3mr148080331cf.34.1757933185995; 
 Mon, 15 Sep 2025 03:46:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPhm7ik7X1a+TDO50ap+Ip0uXXNsB2e3cnGv/RVaneBvoxHYNCZv/40PTOS8XjvrAx4jPRlg==
X-Received: by 2002:ac8:5909:0:b0:4b5:d932:15c2 with SMTP id
 d75a77b69052e-4b77cfd7ea3mr148080031cf.34.1757933185354; 
 Mon, 15 Sep 2025 03:46:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1a8211besm25850191fa.40.2025.09.15.03.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 03:46:24 -0700 (PDT)
Date: Mon, 15 Sep 2025 13:46:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Marius Vlad <marius.vlad@collabora.com>, dri-devel@lists.freedesktop.org, 
 wse@tuxedocomputers.com, andri@yngvason.is, sebastian.wick@redhat.com,
 mripard@kernel.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de,
 simona.vetter@ffwll.ch, harry.wentland@amd.com,
 christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 3/8] drm: Add new general DRM property "color format"
Message-ID: <vnvjpp6makkcwxzcu3ifa767o2u7mi65rvgcwh4725smguej73@oziputg7p252>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-4-marius.vlad@collabora.com>
 <ssvxorsrhum2eo2uiieradrrmytemivr6m5c3mskalehzaj4ci@nc74epxgjq5w>
 <aMMDxIWN9TadgVyw@xpredator>
 <6zmp2dzpvcb4hi4kaa66q5o4rlcpdkor75ci4rnvalt2a37f26@lbmvc4t2ow4z>
 <CAPj87rNxGfroKTf1i5UtmmnZ9wDQTdZFDMKw-MLdbCfjTCD=Uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPj87rNxGfroKTf1i5UtmmnZ9wDQTdZFDMKw-MLdbCfjTCD=Uw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX378OxZfOe7so
 4kacUh87hAzNOqsGGhuhW/T4armIAoNQCXyRxmECNmtmhedPfyPEO4VnqcceqY9Ve1kBn4ws7RP
 1OBj6MA0AhJMXmNcF1v0/cG585LTxo3W/j8ZFVdArJqs+LIVdpk3+AL903Nj7l7fbz0HU+8x0f1
 kqVcfT70/zPowdbf/4Fj+wmjqt+Sf7y9xmEgoW2fViMeIEhWmfP+ct0NxDys5U/XSdk5J29f3Qr
 tRlwnT5as8oR25JKdzMDfFXp8LJ8bGIazzMpcUo753h5sGxjruFQNkJS9gwhBaBHisHdVU1cbQs
 3+UPtSqfQNenYzSuMvOk0pLFasuRnTaFJgHE4DGR8tUiLRS426viqlj0ITl9FY3ffRoixdSSwgg
 AG7rvitO
X-Proofpoint-GUID: WiBqJsCqEW7DUSt2RcfdsWX6LfAnh2JX
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c7ee83 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=3a9zs_iDkljztyLwqRsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: WiBqJsCqEW7DUSt2RcfdsWX6LfAnh2JX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025
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

On Mon, Sep 15, 2025 at 12:33:08PM +0200, Daniel Stone wrote:
> Hi Dmitry,
> 
> On Mon, 15 Sept 2025 at 02:57, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > On Thu, Sep 11, 2025 at 08:15:48PM +0300, Marius Vlad wrote:
> > > On Thu, Sep 11, 2025 at 04:50:59PM +0300, Dmitry Baryshkov wrote:
> > > > It's unclear, who should be combining this data: should it be the kernel
> > > > or the userspace.
> > >
> > > Userspace. I've went a bit into why that is in the cover letter. That
> > > was a pain point in the previous versions raised by other folks. Drivers
> > > are free to advertise whatever color formats their HW supports. To
> > > filter what panel/display supports userspace would look at the EDID and do an
> > > intersection with the ones with the driver. This not uncommon, userspace
> > > already looks today at the EDID for color management / HDR purposes. There's
> > > just too much for the kernel to handle and rather than offloading that
> > > to the kernel, people suggested previously to let userspace handle that.
> > >
> > > > From my POV deferring this to the userspace doesn't make sense: there
> > > > will be different quirks for monitors / panels, e.g. the EDID wrongly
> > > > advertising YUV or not advertising a knowlingly-working capability.
> > >
> > > Yeah, for sure. There have been some folks also raising that and discussing
> > > that a bit further in previous thread on similar topic:
> > > https://lore.kernel.org/dri-devel/TY4PR01MB14432B688209B2AA416A95228983EA@TY4PR01MB14432.jpnprd01.prod.outlook.com/
> > >
> > > Note that people have added quirks into libdisplay-info library to
> > > overcome these limitations. It is far more easier to that into a library
> > > than in the kernel.
> >
> > This forces everybody who wishes to use this property to use that
> > library (or to duplicate the code, making it spread over different
> > projects).
> 
> This really is already the case though. There is far more than the
> kernel can parse and handle in connector modes - and far more than it
> makes sense for the kernel to do.
> 
> The kernel absolutely should have enough to support simple usecases,
> e.g. console and splash screen, to make sure that they work out of the
> box no matter what. But once you get into HDR/YUV/VRR/stereo/etc
> usecases, it doesn't make sense for the kernel to abstract the EDID
> parsing so much that userspace never needs to touch it - it makes the
> kernel just a lossy middle barrier. So if you look just at
> compositors, all the big four of KWin, Mutter, Weston, and wlroots,
> all use libdisplay-info to parse the EDID. And that's fine - they also
> use libevdev and libinput to handle raw input data, and libxkbcommon
> to deal with the pain that is keyboards.

I understand the HDR part, but what is so special regarding YUV? We
already need to parse VSDB information inside the kernel.

> > > > I think that the property should reflect the kernel view on the possible
> > > > formats, which should be updated during get_modes() (or every time EDID
> > > > is being read).
> > >
> > > The property advertises the supported color formats by display driver.
> > > Userspace just filters these out based on what the sink supports. This
> > > could just a policy in the compositor / UI.  There's nothing preventing
> > > you to force push from those advertised formats.
> >
> > What is the expected behaviour if userspace asks for the colorspace
> > which is supported by the driver but not by the display?
> 
> Quite possibly just a failure to display. Same as if the driver
> guesses it wrong - including for reasons it can never statically
> detect (e.g. buying a 10m-long uncertified HDMI cable which drops
> signal, or having the cable pulled around a 90° bend making it very
> marginal for transmission).

Ack

> 
> > > > And that's not to mention that there are enough use-cases where the
> > > > connector doesn't have EDID at all.
> > > Totally. But what would be the expectation in that case? Drivers can
> > > still advertise 'Auto' if they'd like.
> >
> > I'm trying to point out that this complicates userspace: it is now
> > required to handle EDID and non-EDID cases for no practical reason. For
> > all other usecases it is enough to query available modes from the
> > kernel.
> 
> But not 'now', because that's been happening for years. And not 'no
> practical reason', because in order to support features the kernel has
> no involvement in (colour management and HDR as a large part), you
> need to see the full EDID.

As I wrote, I completely agree regarding CM and HDR. From my POV the YUV
part isn't that complicated. I might be wrong though.

-- 
With best wishes
Dmitry
