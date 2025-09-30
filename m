Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED263BAE7D7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 22:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CE410E2D9;
	Tue, 30 Sep 2025 20:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CH3625vM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505CF10E2D9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:04:53 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCB7eS018092
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zg3Zzvp03iY3h5H8RDIo7/4x7q8AW2bkltfV7Huplrs=; b=CH3625vMwc5ZpLEP
 PTJgEyBaeEd97nArAK5VVcJgYq4U+VtebDDuKkEt0LG4P9608s5uYEgz4IyvElwY
 KLZec41AXZsKRAXolSolL7ZjHZOUnRLRLRG02b67Nj2xjAFcBKAGv7urT3bvpAj2
 DFo8rKj3ipLLfsz1Pdd22QJYOQtgUeTVPHxspw7BNWCQPxs6zd4eCxK4Cf4CNBzm
 D7dBVhEoOX+KmE0fXzxnf4F5vOJDu/OPjyZ9he3BC+TFGoHeURsJO91GW3MgZxyW
 xlt5PTQRUojTj8fV1dsUOxKJyZ1ZnQsP5P+wx3lAPngJ1IR4NK7dENGDEDMekX/y
 8TljaQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hj1fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:04:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4dbd8484abbso78454381cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 13:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759262691; x=1759867491;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zg3Zzvp03iY3h5H8RDIo7/4x7q8AW2bkltfV7Huplrs=;
 b=iyE3RBAWo0YjbkAK4Q8KW3te/8iGZhu8FJ7s59M1XaUqPK7EpAoCnMkUHVryW6jpl6
 /dyo+1x2xMUt5txfRnzp7OexAEnIYpJplF30tSO7aQnMpp4rsooPCSb6kJ1FgTngvPcT
 L86ERmSi/RSFS3HxhY0d5x0CS47tFapBPuN1a1oPLVyt08+JE9QHdOkgXUCs87GhvrkD
 uBr9N2amipOevay6P/EiyjJd2AZJB+WtvWvRLBhzeyPPMBZWKc5kVOi/AA2uiGg8Go7N
 o9L7/2OmuIPLkiAmPSuGcIlXg8+woJTtJHbSAGOBOiF3/WbQTlb0qgkorttVx83YZc9h
 M2OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULTQnXX845nu2+EDas984IMlKZjk2gT9W8F1VOoWtdBJO2Mx9jbFzJC1jPe0FqwommZNqH8h+AvZg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvWFCn2CVhV5GdMxwlolZRETupv7cDNyiywLgfrLHlvCDocI+x
 A6WqI8EsvZDSrwUYrRLg1HQsTzyFVJiMX9+FdgBI/UfNkG6xPosSzwXS2md5cVIHlJsmsKLKcqC
 cAQg1TxX8Ozz8wTq2XR9+ZENiIGpIL7y1ZRSPKBF7l/N093IBm5QIMBgP8LPCnVM2UudKhJk=
X-Gm-Gg: ASbGncuJy54FZGGM/8SI1JBUElp2GLTqqOuVU8KETrNrXepl5VAhZ8028WYuan2UEpv
 XITEzu1UZU3k+mRqYLOhgvc/K+76ivS8lsic0+QaLaNUwaINtDGuohsE1tNVihy6og31vWL3+ET
 n81fJPoRqiEaVNqauq9ATw6v7b0I3N8MWVgI3DkAd5cLTFHz9H+BkduJG72YDkIeDcxW0WMoyLx
 IQhVPisM1Ht2fuW0mU38VFvfazuP5lWZjbmR+jyQXD7gjbaDzk+nQSogrUxcMyeLo5a4BkQTxeL
 1prwIefHAvzprKIMUo9NhLi7qQfV2A6FPQdzVzWTwDy4jyau7/K6xsspuFmxQMHbcaDalDeYF3e
 F+iTkBCAlqCzzFOcfz4bje6ip5QJmbs1QK5xYOaDueUAryr/0HkE3kNs+tQ==
X-Received: by 2002:ac8:5784:0:b0:4d2:1a1f:135b with SMTP id
 d75a77b69052e-4e41c352bf6mr11232761cf.3.1759262691085; 
 Tue, 30 Sep 2025 13:04:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP5ORF0qEE//SUqswuiz6DFvjyfROnKL5KhLvMwinIagTmqNjxOJv7FbfJrexGy1JHt7tofw==
X-Received: by 2002:ac8:5784:0:b0:4d2:1a1f:135b with SMTP id
 d75a77b69052e-4e41c352bf6mr11232231cf.3.1759262690616; 
 Tue, 30 Sep 2025 13:04:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583134312ffsm5277474e87.13.2025.09.30.13.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 13:04:49 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:04:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Message-ID: <2krnfl46ozmjt6ekr3p5gzdcvehadzwbyjow72mqi52ciunioz@oqdgqjt4tpeo>
References: <20250926211236.474043-3-imre.deak@intel.com>
 <20250929063644.533890-1-imre.deak@intel.com>
 <agzmuyty22gxtm7cwpdl7ynmrubot45e65tfavbq5muamn6qnj@2wsbjqlc3pye>
 <aNpbCWlluJfsjSE6@ideak-desk>
 <6qj46wruaj5k2ywepsrkzfyyq4bsvcfmg7jhvrk4w2jkhcyorg@llo7bzmlarre>
 <aNvBIdJbaCBzKVt_@ideak-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNvBIdJbaCBzKVt_@ideak-desk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX7YmFn/2lZhDL
 RptRO0YF+eVujJwE1+TqpTs+bIBwcO5ZnWb82P76G6NVwSuz67P/+wXumdzIp1s/AGGDMInPbnD
 +AM4AYUiUgopC0TBro4c1OTpnd7Km6fQh3zZwwNw58uJU7/5BB7k3A0kWlX8U/t/m3tSIJPVuf1
 N0a4hgBhvERw8oRUVEztcRjdlZLUYOB1TgJSCezL5NVS2w9yTGmmZWpACenoTNQSpYjl9DG4mCg
 qKGwZoEAhS9KElFNiZ+fJQcEaSUuepjQU7jByoVXlLiNvp13e47YApFPvZENwyl0YnM/YUNrHZS
 F/ihFDVRq7PUDYgxnyggas5BqUz8RLz1mVZ10+M/l1mjBk6+lQm6kP0jpat9LHmBdUUeg7WaGB4
 fCeoWfyDQx6Vt4GnUQrDWbDaB9bpLw==
X-Proofpoint-GUID: TtzwqglA-AWQTvkfzXXKkXoNDL1CxfBV
X-Proofpoint-ORIG-GUID: TtzwqglA-AWQTvkfzXXKkXoNDL1CxfBV
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dc37e4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=oTBndsSxvoqh1Z8t8QYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041
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

On Tue, Sep 30, 2025 at 02:38:09PM +0300, Imre Deak wrote:
> On Tue, Sep 30, 2025 at 08:30:10AM +0300, Dmitry Baryshkov wrote:
> > On Mon, Sep 29, 2025 at 01:10:17PM +0300, Imre Deak wrote:
> > > On Mon, Sep 29, 2025 at 12:00:03PM +0300, Dmitry Baryshkov wrote:
> > > > On Mon, Sep 29, 2025 at 09:36:44AM +0300, Imre Deak wrote:
> > > > > Add helpers to query the DP DSC sink device's per-slice throughput as
> > > > > well as a DSC branch device's overall throughput and line-width
> > > > > capabilities.
> > > > > 
> > > > > v2 (Ville):
> > > > > - Rename pixel_clock to peak_pixel_rate, document what the value means
> > > > >   in case of MST tiled displays.
> > > > > - Fix name of drm_dp_dsc_branch_max_slice_throughput() to
> > > > >   drm_dp_dsc_sink_max_slice_throughput().
> > > > > v3:
> > > > > - Fix the DSC branch device minimum valid line width value from 2560
> > > > >   to 5120 pixels.
> > > > > - Fix drm_dp_dsc_sink_max_slice_throughput()'s pixel_clock parameter
> > > > >   name to peak_pixel_rate in header file.
> > > > > - Add handling for throughput mode 0 granular delta, defined by DP
> > > > >   Standard v2.1a.
> > > > 
> > > > This one got sent as a separate V5, without a proper changelog. What has
> > > > changed?
> > > 
> > > This is v3 of the patch, the changes are listed under v3. The patchset's
> > > version is v5.
> >
> > Ugh. How one does relate this v3 (which is not mentioned anywhere) and
> > v5 of the series? This is totally counterintuitive. A usual
> > recommendation is to send the full series and to send it as a new
> > thread, sending all the patches in one go.
> 
> It's a common practice on intel-gfx to send a new version of one patch
> on top of the last patchset version in that patchset's thread. For

I don't want to step on intel-gfx ways of working, but how would that
work with e.g. 'b4 shazam'?

> matching the patch version to the patchset version I can change the
> patch version log above to be like:
> 
> v2 (Ville):
> - Rename pixel_clock to peak_pixel_rate ...
> v3-v4:
> - No changes
> v5:
> - Fix the DSC branch device minimum valid line width value ...

Yes, I think that's more obvious, thanks!

> 
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/display/drm_dp_helper.c | 156 ++++++++++++++++++++++++
> > > > >  include/drm/display/drm_dp.h            |   3 +
> > > > >  include/drm/display/drm_dp_helper.h     |   5 +
> > > > >  3 files changed, 164 insertions(+)
> > > > > 
> > > > 
> > > > -- 
> > > > With best wishes
> > > > Dmitry
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
