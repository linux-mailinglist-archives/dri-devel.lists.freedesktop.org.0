Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85E4A7709A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 00:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21ED310E4A4;
	Mon, 31 Mar 2025 22:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOBKivb/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603B510E4A4
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 22:00:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCupn011984
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 22:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mkFZoZXQJzJt0Cg5UOTM27a1
 fl/MrtPgUNj+Jrp+bYg=; b=YOBKivb/vSQMJi59VIMk0WZG2rYeBMWW5n0rV8qc
 OqREB8zPgGOOHTSM4GZGpkBWovRFRnzo8twAgi2oZIGgKN5Gvsd0H/zxgsAvZKBW
 GWFJJJ2z7FChxQJSFSH37TZDgceiKYvRwgNJKinDY2XdW5uYYDPOXkYGdic3NzcD
 54RW8chblSN1CVZMmWo2qratP3c78XePJQRokqSutLepMnkN3DeqxFZuiyuwM8yB
 qOKSo3CYgP/lxSnOU0sUOO85JW3YoXMdvuWcvKtPws3u/qxdRAAuatOYhMn0+jhn
 Ie380S+2Ln9of7KWmBC2wmQ4Oz8+99VnSHwsttQT+5NUqg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9mjnm6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 22:00:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2ff52e1c56fso12097742a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 15:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743458443; x=1744063243;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mkFZoZXQJzJt0Cg5UOTM27a1fl/MrtPgUNj+Jrp+bYg=;
 b=S42n6/lpwKjp5uJtPJdniauwuiWbfjwFUKjgiZD+/jmEtbI3JgLzQQUwN8F7K3blbY
 0B+cZqXUhSoBb2TJAbhmtXzpbKOSO2HVf/3j2KCVTmhVR5h//+pzcDysyyv3Q48QAOE2
 oiKJDtyiKo2D2w50Y+yNCK7FsTl6KsmWhXa8ptXgah548xin7T8SJhvOCJnIZ2kstsqU
 sYS3LYWj7M/4x/GeLOQR9AuFDkQkrY+bH82a1XZw5c+Oim+gS1X9XjiHXQms6SNcVk2J
 Uiglz/c4CxvnqZ2ax6BIlbqhjPQHnhJwE1QFEQl4d8eZ+16K+zo/KVtQY4rscZrWvO9i
 4s9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMEWW/lg7/OlLiHT2HI4h6ziUq/cDvcQ1XUMtxrD5Y9jUOQfA1J6PtAPjgJdbSv5k61tsqVuz4hLM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ3GpqtX8OaPrqzqONdFxYwJm39surBn8e+m21HcAkmc/prCBz
 o3avXyI/j8ip30z5fO8PdCKZwq6W3hY70WypmsMwZMADyHZgnnQdtgBo9U8wNK2C6mabUen9x4C
 Qs1UwEWQ4efoOB+CRwjDGVbOaKouQ6356KxFMV5XrWZjKU4oA3Mn8AfOy0WfaWmfDSWy22awIwM
 SrkVtbBGpqO+sVmbFG4YWB6kvs8OrmdbCVvjgJYObBbg==
X-Gm-Gg: ASbGncv8hjR20ctcuTFZminrCgg7wIgDGxVoHNGUpyOMA4t+lfyTViqlSLsSJ2SKu9S
 1sHApuZRSOF5wr6CiMdaKjU8hfCr9imnU88b+nYq0etaoJPDpQXKR4MWn4bWl2pGRbYiVdy16
X-Received: by 2002:a17:90b:4ed0:b0:2fe:a79e:f56f with SMTP id
 98e67ed59e1d1-30531fa2e07mr17238376a91.13.1743458442838; 
 Mon, 31 Mar 2025 15:00:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRjxY76/5/UsuzMPvfK4iO1euUPzgYJFxPuu7zecfhm4WiN69/SwrKxiGXZio8ZH7TREkRUUaI7irNgCBpWcU=
X-Received: by 2002:a17:90b:4ed0:b0:2fe:a79e:f56f with SMTP id
 98e67ed59e1d1-30531fa2e07mr17238311a91.13.1743458442457; Mon, 31 Mar 2025
 15:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
 <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-1-45d5f2747398@linaro.org>
 <Z-pJP4PMwPo3L3Og@hovoldconsulting.com>
 <CACr-zFA_oSySRnA2VaSQk2ND_AHeyt3v=RuPTbABPM7SYown6g@mail.gmail.com>
 <b4983b93-97fc-43ed-a41c-a44f90773062@oss.qualcomm.com>
 <CACr-zFDDPfRXZYUsbMoBASU6O5mBmqiFNFBtZTL9_vbo_7uANg@mail.gmail.com>
In-Reply-To: <CACr-zFDDPfRXZYUsbMoBASU6O5mBmqiFNFBtZTL9_vbo_7uANg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 01:00:31 +0300
X-Gm-Features: AQ5f1JpqhHc7KEz0u200xVRtc-LLhmuNIHxpZh6lPavUuGu8Ac7aioAB8xnQ09Y
Message-ID: <CAO9ioeV9JoED9pvdwJneB1+-=uWW_XZ3Dm0ckQbiv7kfA7usoA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 eDP panel
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Mfhsu4/f c=1 sm=1 tr=0 ts=67eb108b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rRiRvEloSRtx8nxw5TkA:9
 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: z0yPbHwl3rikcLTUovfLI0FYvWjITjfM
X-Proofpoint-GUID: z0yPbHwl3rikcLTUovfLI0FYvWjITjfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_10,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310151
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

On Tue, 1 Apr 2025 at 00:38, Christopher Obbard
<christopher.obbard@linaro.org> wrote:
>
> Hi Dmitry,
>
> On Mon, 31 Mar 2025 at 17:49, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On 31/03/2025 18:39, Christopher Obbard wrote:
> > > Hi Johan,
> > >
> > > On Mon, 31 Mar 2025 at 09:50, Johan Hovold <johan@kernel.org> wrote:
> > >>
> > >> On Thu, Mar 27, 2025 at 04:56:53PM +0000, Christopher Obbard wrote:
> > >>> The eDP panel has an HPD GPIO. Describe it in the device tree
> > >>> for the generic T14s model, as the HPD GPIO property is used in
> > >>> both the OLED and LCD models which inherit this device tree.
> > >>
> > >> AFAICT, this patch is not correct as the hotplug detect signal is
> > >> connected directly to the display controller on (these) Qualcomm SoCs
> > >> and is already handled by its driver.
> > >>
> > >> Describing it as you do here leads to less accurate delays, see commits:
> > >>
> > >>          2327b13d6c47 ("drm/panel-edp: Take advantage of wait_hpd_asserted() in struct drm_dp_aux").
> > >>          3b5765df375c ("drm/panel: atna33xc20: Take advantage of wait_hpd_asserted() in struct drm_dp_aux")
> > >>
> > >> Perhaps you lose some other functionality too.
> > >>
> > >>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > >>> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > >>> ---
> > >>>   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 11 +++++++++++
> > >>>   1 file changed, 11 insertions(+)
> > >>>
> > >>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > >>> index 962fb050c55c4fd33f480a21a8c47a484d0c82b8..46c73f5c039ed982b553636cf8c4237a20ba7687 100644
> > >>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > >>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > >>> @@ -980,8 +980,12 @@ &mdss_dp3 {
> > >>>        aux-bus {
> > >>>                panel: panel {
> > >>>                        compatible = "edp-panel";
> > >>> +                     hpd-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
> > >>>                        power-supply = <&vreg_edp_3p3>;
> > >>>
> > >>> +                     pinctrl-0 = <&edp_hpd_n_default>;
> > >>> +                     pinctrl-names = "default";
> > >>> +
> > >>>                        port {
> > >>>                                edp_panel_in: endpoint {
> > >>>                                        remote-endpoint = <&mdss_dp3_out>;
> > >>> @@ -1286,6 +1290,13 @@ hall_int_n_default: hall-int-n-state {
> > >>>                bias-disable;
> > >>>        };
> > >>>
> > >>> +     edp_hpd_n_default: edp-hpd-n-state {
> > >>> +             pins = "gpio119";
> > >>> +             function = "gpio";
> > >>> +             drive-strength = <2>;
> > >>> +             bias-pull-up;
> > >>> +     };
> > >>
> > >> I checked the firmware configuration for this pin on my T14s, which
> > >> does not match what you have here. Instead the function is set to
> > >> "edp0_hot" which forwards the signal to the display controller which
> > >> already handles the signal on panel power on. (And there is also no
> > >> internal pull up enabled).
> > >>
> > >> We may want to describe this pin configuration somewhere, but that's a
> > >> separate issue.
> > >
> > > Thanks for your review, I will send another version in coming days and
> > > drop this first patch (adding hpd to the T14s DTSI).
> > >
> > > As a consequence I will need to add no-hpd property to the panel node.
> > No, you won't. There is a HPD line and it is routed to the DP controller.
>
> OK, I think I misunderstand what Johan said. After taking some time to
> think about it in more detail:
> - The first commit will be changed so that the hpd GPIO will be added
> to the X1E DP controller instead of the panel. grepping the source for
> dp_hot_plug_det shows me how to do that. This part is clear.
>
> - The panel node in the generic T14s DTSI should not have the
> hpd-gpios property / pinctrl set.
>
> - The panel node should not have the hpd-gpios property / pinctrl set.

LGTM. Use sc8180x-primus as an example

>
> I hope I understand that correctly. I will send a new series in the
> morning unless there is any objection.


-- 
With best wishes
Dmitry
