Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE76B45A1A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 16:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C625810E2F0;
	Fri,  5 Sep 2025 14:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NuNvEwp+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB3410E2EA
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 14:10:07 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585CUcc5018501
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 14:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 acLk0y8MgVXQzS1w3CddwQhvyTNJ65p29luO5znXiyo=; b=NuNvEwp++q0PT7li
 pEvLs50MLCg5BElOS9V5l2knLoadgJENm6XMu9EfOwEe0nh0nBjmC7GAAwQgB2Q4
 p/hiypg0uUTh447sF2ybr55gUBeNB+FZn0cIXM3r2A8IqoczX46n6ZEJ/yn3NOvf
 BpHlXfWzGt5RIrXhTEKG5VffBaT1x7fJHcvxxLAhFOxSeO97dzRV6ib+XVR0kA+T
 qupXDTEAm/4R9o16tQ6jaD0A7M5TH4xxHzdFyJM48iZCISeF3hx5RgHUwRBf1C0N
 tBKmN899Q87HoC8QgcBotfaJDrHXn2ZdDl+2vIeMeho0CzQI/J1egj1YtLqcmNVl
 KCu+Jg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48yebuu822-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 14:10:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b4980c96c3so80151371cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 07:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757081406; x=1757686206;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=acLk0y8MgVXQzS1w3CddwQhvyTNJ65p29luO5znXiyo=;
 b=R5VYqaFPIbQNIxvSoJyMo8krfloU/7w9rysabjRn4CalrNarLrnCO4mMK+Ofs38vaZ
 PnXFH8k26ZJ+eryIPHwW65hDK4eDSaHXKuqG9H2Q5yaQ30kJtYdDdQ7Z2Hhr4mTnba6X
 q74S1qh5xJEhiA319WgSNYkFxQq4fNX1v+X8W+U+pBbMQGUJU57xjxzAlUyHsEgCqOYt
 xrvV+DhGhnNT9QsnhP++Eswr0yrXvKO/uHEh5o5dbNY7AV/Qwbs7gTv7wVCPhr2D+dCQ
 zHqHQp1WYrOH4hWXhh+JR8c3h4+dx7vAmf2C7+ezTyfWpA1hpvMq/90hko9tKdAaXDJA
 iX+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQTXPoLtWTwH6Ui0A6ABTZI4v65mYMmQMbXYBeUWp6aRFXGczj8N2I8O2ll/mB0wGgb8eXRx6M6AU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSeuNpL9WdLJM+JMVU5Eet3bOBOUOVn+Jge4IU6j3MKlhkC29a
 GFIGroCVclOjlEUUg/FWsn9CY6kJtTp7gCI0Ch1ITRKTnsDN0c97SfEwNgsGRVRjbs2cHWf29jd
 k7AkXRA+n6z8QNnTyJxf8dei2gkbTpW4q9QZDl2k7KdwZIc+5w7NSZrpOtgNPfyIoEhx21hM=
X-Gm-Gg: ASbGncsDQ3QGQJZSUU5YtLsbiCOyFnrappOqwdewkePZjKCZT9axYrKgYIQcHLqLrw8
 wfjJ510WhYhjaZqSislUeftrB40MwuhDCtSOcf5wPvr2AGDVRE5TwsqsqlJ/FIMC2F0MJoHSsFQ
 xBDM2TaFyXDe1AmnGCzcHm3y68pn/OPendd5nOsWo58tLMcb/cVkjLFY5bhBs9cdwzYg3B1fLve
 WQDd+4FDuUI6V/KWY1XwFMmkG3rhSbGAqCSGcdiWL9rqDTYJuy0hKoGAq3FpNOamHPm46mQ8jCN
 DRd5daQbXqUH9CrP/RhTxNXdS5Pz1bFXJxM+PyYXAmCSeVRSZdq4ugfnIyKwtEC/zUbvIg0bJFv
 iCDAFfSFMI5lpxhFG+/vLvHcjM6zSoMGU3x6SPh59H0py4uczz9KM
X-Received: by 2002:a05:622a:1e8d:b0:4b4:989a:a272 with SMTP id
 d75a77b69052e-4b4989aa569mr113668541cf.47.1757081405835; 
 Fri, 05 Sep 2025 07:10:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOfPTOrjUqnLR4aMEH1xnlRcOTOPfE1zbMPnBX5+k5I8ggujVWCh/TSBkjhOJHzCpNhfYEfA==
X-Received: by 2002:a05:622a:1e8d:b0:4b4:989a:a272 with SMTP id
 d75a77b69052e-4b4989aa569mr113666471cf.47.1757081404070; 
 Fri, 05 Sep 2025 07:10:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608abc161csm1784268e87.55.2025.09.05.07.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 07:10:03 -0700 (PDT)
Date: Fri, 5 Sep 2025 17:10:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Cc: syyang <syyang@lontium.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 xmzhu@lontium.com, llzhang@lontium.com, rly@lontium.com
Subject: Re: [PATCH v1 2/2] This patch adds a new DRM bridge driver for the
 Lontium LT9611C chip.
Message-ID: <ipjzhwkvmdvoxuai3yl6mrl3jm4gahnhtnuqln473vlsz37axu@ptpef36fwcid>
References: <20250903123825.1721443-1-syyang@lontium.com>
 <20250903123825.1721443-3-syyang@lontium.com>
 <24rahlm4kkob7knapdxxnjixye3khx3nv2425y4kkirat4lmam@gjey7zqsnzks>
 <CAFQXuNZUfAJe4QEDfi+-1N99xO0_z5_Omnsn_-SXr2QPtvdL_g@mail.gmail.com>
 <7cyypk5j7o5fglmibshg45iysffpdl75m6rqvv4b5zntfevhiz@zlt7ybuzkvrg>
 <CAFQXuNb+Eq6KPFvsnmGvn7KKjn4WRtMy1x4pn4ZvZoQ-_S_fYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFQXuNb+Eq6KPFvsnmGvn7KKjn4WRtMy1x4pn4ZvZoQ-_S_fYQ@mail.gmail.com>
X-Proofpoint-GUID: mYAoADkxTTKEo8Pqfp64DytcZieyGVsZ
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=68baef3f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Fy06R7qyhczz9_k_:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Kz8-B0t5AAAA:8 a=ruwdpqL4po3ky7NklPMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MyBTYWx0ZWRfXz1wTZGSdmo8Q
 Eysy9VTQpyShUNh9oNNnWn9FnCIEl5pdhwtHazF65/J13u0MMNBin1vKbbQZMyIgCds4vIKf7B8
 vdmStyDqWODjG9C4xYM6kTXmcg4DQmdXo0QCSP1yPa4FeDcDFJ2jC8GsB4CCC/aKK8MRk+lM/66
 yB7NnpW673jUa1BHZql/1P2aR6e4lHzQ2B6KYzAhyY5f44dmCDxuUuWaoJXjSx71GdoqPyA4zuJ
 TketV/u/G7tOkFDWdDabRxd1A4eqsqKXXzKQeUoFuuRUOLQv4BmxV68m2dBuoxNYSAqGilpC/rU
 vkdQ3e4hlsY7SkQigYiWlR6TQ/CyYdAsMkJgmwFVN6nZnVJKYnzvuPYDnOV9Qqnx6DtEZeipKwB
 RHgD2lKc
X-Proofpoint-ORIG-GUID: mYAoADkxTTKEo8Pqfp64DytcZieyGVsZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509040163
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

On Fri, Sep 05, 2025 at 10:55:51AM +0800, 杨孙运 wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年9月4日周四 22:39写道：
> 
> >
> > On Thu, Sep 04, 2025 at 06:48:13PM +0800, 杨孙运 wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年9月4日周四 10:52写道：
> > > >
> > > > On Wed, Sep 03, 2025 at 05:38:25AM -0700, syyang wrote:
> > > > > The following changes are included:
> > > > >
> > > > > - Updated Kconfig and Makefile to include the new driver
> > > > > - Implementation of the bridge driver at
> > > > >   drivers/gpu/drm/bridge/lontium-lt9611c.c
> > > >
> > > > This is really not interesting, it can be seen from the patch itself.
> > > > Please read Documentation/process/submitting-patches.rst.
> > > >
> > > Sorry,  I will study submitting-patches.rst.
> > >
> > > > Is it possible to toggle infoframes?
> > >
> > > sorry, I don't understand the meaning of this sentence. Please explain
> > > it in detail.
> >
> > Is it possible to control InfoFrames being sent over the HDMI cable?
> > Both contents and enabling/disabling.
> >
> Can be controlled via I2C

Then please implement DRM_BRIDGE_OP_HDMI and corresponding InfoFrame
callbacks.

> > >
> > > > > +
> > > > > +#define FW_SIZE (64 * 1024)
> > > > > +#define LT_PAGE_SIZE 256
> > > > > +#define FW_FILE  "LT9611C.bin"
> > > >
> > > > Please land this firmware to the linux-firmware repository.
> > > >
> > >
> > > The LT9611C has built-in firmware, and when the chip is running, it
> > > uses the internal firmware.
> > > The firmware needs to be updated only when the customer encounters
> > > issues during the debugging phase due to changes in hardware design or
> > > parameters.
> > > When the customer needs to update the firmware, they will apply to our
> > > company for a customized firmware.
> > > They will place this firmware under /lib/firmware, and then reboot the
> > > platform. After that, the driver will update the firmware.
> > > So I think there is no need to upload the firmware.
> >
> > Then please make firmware updates opt-in, requiring some user action.
> > I'd suggest first getting the simplfified version of the driver in
> > (without fw update capabilities) and then adding FW upgrades in as a
> > separate patch.
> >
> I will research it.

Research... what?

> > > > > +static unsigned int get_crc(struct crc_info type, const u8 *buf, u64 buf_len)
> > > >
> > > > Use library functions for that.
> > > >
> > >
> > > I'm not sure whether the algorithms in the llibrary functions are
> > > consistent with those designed in our chip.
> > > If either of them changes, it will cause the firmware updated to the
> > > chip to fail to run.
> >
> > CRC polynoms don't change that easily
> >
> > > I think it's safer to implement it using our own code.
> >
> > No, it's not.
> >
> If we calculate CRC_1 using the library function and then burn it
> together with the firmware into the chip, when the chip boot, it will
> use the internal hardware to calculate the firmware CRC_2.
> If CRC_1 is not equal to CRC_2, the chip will fail to boot. The
> library function will not be changed. I'm worried that the algorithm
> in our chip's hardware is different from the library function. I'll
> research it.

Please take a look first, before having fears or implenting yet another
CRC function.

> 
> > > I'll check it.
> > > > > +static int lt9611c_prepare_firmware_data(struct lt9611c *lt9611c)
> > > > > +{
> > > > > +     struct device *dev = lt9611c->dev;
> > > > > +     int ret;
> > > > > +
> > > > > +     /* ensure filesystem ready */
> > > > > +     msleep(3000);
> > > >
> > > > No. If the firmware is necessary and it's not ready, return
> > > > -EPROBE_DEFER.
> > > >
> > > The firmware is unnecessary . This part of the code is for customers
> > > who need to upgrade the chip firmware.
> > >
> > > Due to the different designs of the platform, the firmware used by
> > > each customer may be different.
> >
> > Well... That's a very bad way to go. We have had this issue with
> > LT9611UXC at one of my previous jobs. Our customers have had various
> > kinds of issues because of the wrong firmware.
> >
> > Please provide some reference, which works in a DSI-to-HDMI case and
> > make it _tunable_ rather than requiring to replace the firmware
> > completely.
> >
> i will research it.
> Yes, you worked together with my colleagues to handle the issue of
> LT9611UXC. (At that time, you used dmitry.baryshkov@linaro.org)
> 
> > >
> > > Therefore, when they need to update the firmware, they only need to
> > > compile the firmware into the /lib/firmware directory during the
> > > compilation
> > > process, and then burn the image into the platform.
> > >
> > > Once reboot platform, the firmware upgrade can be automatically completed.
> >
> > The firmware upgrade must be triggered by user, unless the FW is
> > completely empty.
> >
> Is it necessary for the authorities to insist on doing so?

I think so. The rootfs might be the same for different devices,
different use cases, etc. So your 'load and program firmware if it's
present in rootfs' doesn't work in a general case.

> > > > > +static const struct drm_edid *lt9611c_bridge_edid_read(struct drm_bridge *bridge,
> > > > > +                                                    struct drm_connector *connector)
> > > > > +{
> > > > > +     struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > > > > +
> > > > > +     usleep_range(10000, 20000);
> > > >
> > > > Why?
> > > >
> > > Delay for a while to ensure that EDID is ready.
> >
> > Your other chip had interrupt status to note that EDID is ready. I hope
> > you have that one too. Blindly calling usleep_range() is a bad idea.
> >
> Different chips have different logic. i will research it.

Thanks.

> > > > > +static int lt9611c_hdmi_hw_params(struct device *dev, void *data,
> > > > > +                               struct hdmi_codec_daifmt *fmt,
> > > > > +                              struct hdmi_codec_params *hparms)
> > > > > +{
> > > > > +     struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > > > > +
> > > > > +      dev_info(lt9611c->dev, "SOC sample_rate: %d, sample_width: %d, fmt: %d\n",
> > > > > +               hparms->sample_rate, hparms->sample_width, fmt->fmt);
> > > > > +
> > > > > +     switch (hparms->sample_rate) {
> > > > > +     case 32000:
> > > > > +     case 44100:
> > > > > +     case 48000:
> > > > > +     case 88200:
> > > > > +     case 96000:
> > > > > +     case 176400:
> > > > > +     case 192000:
> > > > > +             break;
> > > > > +     default:
> > > > > +             return -EINVAL;
> > > > > +     }
> > > > > +
> > > > > +     switch (hparms->sample_width) {
> > > > > +     case 16:
> > > > > +     case 18:
> > > > > +     case 20:
> > > > > +     case 24:
> > > > > +             break;
> > > > > +     default:
> > > > > +             return -EINVAL;
> > > > > +     }
> > > > > +
> > > > > +     switch (fmt->fmt) {
> > > > > +     case HDMI_I2S:
> > > > > +     case HDMI_SPDIF:
> > > > > +             break;
> > > > > +     default:
> > > > > +             return -EINVAL;
> > > > > +     }
> > > >
> > > > Does that add anything on top of the limitations of hdmi-codec.c?
> > > >
> > > The parameters supported in the hdmi-codec.c may not be supported by
> > > my chip. Therefore, we can exclude the parameters that are not
> > > supported by the chip.
> >
> > Are they?
> >
> The firmware handles all parameter adaptation autonomously. This code
> merely needs to expose the chip's capabilities to hdmi-codec.c.

Which params are supported by hdmi-codec but not suppored by your chip?

> 
> > >
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static void lt9611c_audio_shutdown(struct device *dev, void *data)
> > > > > +{
> > > > > +}
> > > > > +
> > > > > +static int lt9611c_audio_startup(struct device *dev, void *data)
> > > > > +{
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static void lt9611c_audio_update_connector_status(struct lt9611c *lt9611c)
> > > > > +{
> > > > > +     enum drm_connector_status status;
> > > > > +
> > > > > +     status = lt9611c->audio_status;
> > > > > +     if (lt9611c->plugged_cb && lt9611c->codec_dev)
> > > > > +             lt9611c->plugged_cb(lt9611c->codec_dev,
> > > > > +                              status == connector_status_connected);
> > > > > +}
> > > > > +
> > > > > +static int lt9611c_hdmi_audio_hook_plugged_cb(struct device *dev,
> > > > > +                                           void *data,
> > > > > +                                      hdmi_codec_plugged_cb fn,
> > > > > +                                      struct device *codec_dev)
> > > > > +{
> > > > > +     struct lt9611c *lt9611c = data;
> > > > > +
> > > > > +     lt9611c->plugged_cb = fn;
> > > > > +     lt9611c->codec_dev = codec_dev;
> > > > > +     lt9611c_audio_update_connector_status(lt9611c);
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static const struct hdmi_codec_ops lt9611c_codec_ops = {
> > > > > +     .hw_params      = lt9611c_hdmi_hw_params,
> > > > > +     .audio_shutdown = lt9611c_audio_shutdown,
> > > > > +     .audio_startup = lt9611c_audio_startup,
> > > > > +     .hook_plugged_cb = lt9611c_hdmi_audio_hook_plugged_cb,
> > > > > +};
> > > >
> > > > No, we have HDMI audio helpers for that. Drop this and use the helpers
> > > > instead.
> > > >
> > > ？？？ I don't understand.
> >
> > See <drm/display/drm_hdmi_audio_helper.h> and
> > https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com/
> >
> i will research, thks.
> Could you please share the latest driver file for lt9611uxc.c that you
> have written? (to this email: syyang@lontium.com)

No, I will not. It's called upstream, because everything is either in
the tree or on the mailing list.

> > > > > +     if (lt9611c->audio_pdev)
> > > > > +             lt9611c_audio_exit(lt9611c);
> > > > > +
> > > > > +     if (lt9611c->fw) {
> > > >
> > > > You definitely don't need firmware when the bridge is up and running.
> > > >
> > > The previous text has already described the working logic of the firmware.
> >
> > It's another topic: you are storing the firmware in memory while the
> > driver is bound. It's not necessary. You can release it after updating
> > it on the chip.
> >
> I understand what you mean.

No, you don't. The driver can call release_firmware() after flashing the
chip. That's it at this point. Nothing more.

> Based on the above conversation, your intention is that when the
> customer needs to upgrade the firmware, they should modify the
> comparison conditions of the version, then compile and burn the
> kernel, and then perform the firmware upgrade, just like the LT9611UXC
> driver. Instead of loading the firmware every time.

Of course not. I've asked to add a way for the user to trigger firmware
update. It might be a sysfs file (like I did for lt9611uxc), it can be
modparam or anything else. But again, this is not relevant _here_.

I simply ask you to release the memory after it is no longer needed.


> My design intention is to avoid the need for recompiling the driver
> when upgrading. Instead, a file named "LT9611C.bin" can be directly
> sent to the "/lib/firmware" directory via scp. Then you can either
> perform a reboot for the upgrade or execute the command manually for
> the upgrade.

Rootfs might be read-only, it might be shared via NFS, it might be
coming from the cloud via Docker container, etc.

> Perhaps you are suggesting that we could follow the design approach of
> the LT9611UXC driver?
> 
> > > > > +
> > > > > +     lt9611c->kthread = kthread_run(lt9611c_main, lt9611c, "lt9611c");
> > > >
> > > > Why do you need extra kthread for that???
> 
> Upgrading the firmware takes time. execute it sequentially in the
> probe function, it will block the system boot.
> Using the kthread method will not block the system boot.

Using async probing. Or program firmware after checking all resources
that are required for the device.

Also, as you've written, firmware flashing is an exception, so delaying
one exceptional boot is not a real issue.

And anyway, this requires a comment in the source file and a comment in
the commit message.


-- 
With best wishes
Dmitry
