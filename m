Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC12A5443A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 09:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F1510E90F;
	Thu,  6 Mar 2025 08:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="ijZGrXL/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0893910E5C9
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 15:29:14 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id 2968A40F1CF4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 18:29:13 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6ffG0qkLzFysn
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 18:26:14 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id 8EE8042733; Tue,  4 Mar 2025 18:26:01 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rock-chips.com header.i=@rock-chips.com header.b=ijZGrXL/
X-Envelope-From: <linux-kernel+bounces-541217-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rock-chips.com header.i=@rock-chips.com header.b=ijZGrXL/
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
 by le2 (Postfix) with ESMTP id 7146642D2A
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:01:11 +0300 (+03)
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
 by fgw1.itu.edu.tr (Postfix) with SMTP id BED653064C0B
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:01:10 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D7587A4079
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 08:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 857381F0996;
 Mon,  3 Mar 2025 09:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com
 header.b="ijZGrXL/"
Received: from mail-m19731113.qiye.163.com (mail-m19731113.qiye.163.com
 [220.197.31.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812E71EFFAF;
 Mon,  3 Mar 2025 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=220.197.31.113
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740992410; cv=none;
 b=JjjprnLfwcLgPDINJGdj/9SBCv1xx7BO9wXPmLxIckKix0VR9mueQWLlnR7FeC142Gsjp1XdDFjk15q7bTuGR8v96r/phO1YRUPRhXFb2uRlq8069N7FYKcGlRDvD9CuMW1eAn2zc+ZaEMZMuxy7H5ISbEBFFeBAUF5xJ6QKbLQ=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740992410; c=relaxed/simple;
 bh=wq4qPjLOP/xCwisKyEVhGFxzfmUqOyAQHZDDXjSFup8=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=rU6s3+tqGs/mIdD5TkDc/niCs5ve+izR7t+ckftRU6O+/eEEKHoiBbsL3ThgSqcjjBStsJ7wTvmuPlOZ+4Bgxae7Tw603xXQGEW0NESrxl/ErPr9eiqNLSfQGybfBZUcoU7ggIROagWVLNrAdLCTvzniBFoRlvreJrRsd+HZLpA=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none)
 header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com;
 dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com
 header.b=ijZGrXL/; arc=none smtp.client-ip=220.197.31.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none)
 header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.12] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes
 [58.22.7.114]) by smtp.qiye.163.com (Hmail) with ESMTP id cbdcb25f;
 Mon, 3 Mar 2025 16:59:50 +0800 (GMT+08:00)
Message-ID: <65706d63-18aa-41e0-81c4-4eab3d186250@rock-chips.com>
Date: Mon, 3 Mar 2025 16:59:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/bridge: synopsys: Add DW DPTX Controller support
 library
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andy Yan <andyshrk@163.com>
Cc: neil.armstrong@linaro.org, sebastian.reichel@collabora.com,
 heiko@sntech.de, devicetree@vger.kernel.org, hjc@rock-chips.com,
 mripard@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org, robh@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250223113036.74252-1-andyshrk@163.com>
 <20250223113036.74252-3-andyshrk@163.com>
 <563i7xcbbsxfezkgs4txsa6lar5tb5folp7zk7dc7sbvf54n6y@vqbtuwvj3fcw>
Content-Language: en-US
From: Yubing Zhang <yubing.zhang@rock-chips.com>
In-Reply-To: <563i7xcbbsxfezkgs4txsa6lar5tb5folp7zk7dc7sbvf54n6y@vqbtuwvj3fcw>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRofTlZNS00YSUJLTx1MHhhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a955b3ba5bf03a8kunmcbdcb25f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PlE6Cio6GjIWQk9IAwE4Ky8Y
 HSMKCT5VSlVKTE9LQkJJSEJPT0JCVTMWGhIXVQIOGRIVHFUBExoVHDsJFBgQVhgTEgsIVRgUFkVZ
 V1kSC1lBWU5DVUlJVUxVSkpPWVdZCAFZQUxITUo3Bg++
DKIM-Signature: a=rsa-sha256;
 b=ijZGrXL/GvtK7VjoWcpULII9nLZ6QYjVvCmSpKIkUJkKkO8KzrlppNmqdiGJa+pTNWIIcvzWHnEv2CM9W4xfzy/uQ4PCH7aL4BdeeauyHwuh0UKdZypiAec+BclL7A2Au52C9+01H1U6dN+o0lq9WqyGZ6Kue/kGZttFRObq5QE=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=2kGVvLoAJaOp26dQa+STctZZP/D+ei2d2VwEfnWjBwo=;
 h=date:mime-version:subject:message-id:from;
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6ffG0qkLzFysn
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741706839.18705@aiEqphgsFKVZ4TXnG0ti+Q
X-ITU-MailScanner-SpamCheck: not spam
X-Mailman-Approved-At: Thu, 06 Mar 2025 08:07:52 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

Hi Dmitry,

On 2025/3/2 2:14, Dmitry Baryshkov wrote:
> On Sun, Feb 23, 2025 at 07:30:25PM +0800, Andy Yan wrote:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> The DW DP TX Controller is compliant with the DisplayPort Specificatio=
n
>> Version 1.4 with the following features:
>>
>> * DisplayPort 1.4a
>> * Main Link: 1/2/4 lanes
>> * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
>> * AUX channel 1Mbps
>> * Single Stream Transport(SST)
>> * Multistream Transport (MST)
>> *=EF=81=AEType-C support (alternate mode)
>> * HDCP 2.2, HDCP 1.3
>> * Supports up to 8/10 bits per color component
>> * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
>> * Pixel clock up to 594MHz
>> * I2S, SPDIF audio interface
>>
>> Add library with common helpers to make it can be shared with
>> other SoC.
>>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>>
>> drm/bridge: cleanup
>=20
> Stray line?
>=20
>>
>> ---
>>
>>   drivers/gpu/drm/bridge/synopsys/Kconfig  |    7 +
>>   drivers/gpu/drm/bridge/synopsys/Makefile |    1 +
>>   drivers/gpu/drm/bridge/synopsys/dw-dp.c  | 2155 ++++++++++++++++++++=
++
>>   include/drm/bridge/dw_dp.h               |   19 +
>>   4 files changed, 2182 insertions(+)
>>   create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-dp.c

......

>> +
>> +static u8 dw_dp_voltage_max(u8 preemph)
>> +{
>> +	switch (preemph & DP_TRAIN_PRE_EMPHASIS_MASK) {
>> +	case DP_TRAIN_PRE_EMPH_LEVEL_0:
>> +		return DP_TRAIN_VOLTAGE_SWING_LEVEL_3;
>> +	case DP_TRAIN_PRE_EMPH_LEVEL_1:
>> +		return DP_TRAIN_VOLTAGE_SWING_LEVEL_2;
>> +	case DP_TRAIN_PRE_EMPH_LEVEL_2:
>> +		return DP_TRAIN_VOLTAGE_SWING_LEVEL_1;
>> +	case DP_TRAIN_PRE_EMPH_LEVEL_3:
>> +	default:
>> +		return DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
>> +	}
>> +}
>> +
>> +static void dw_dp_link_get_adjustments(struct dw_dp_link *link,
>> +				       u8 status[DP_LINK_STATUS_SIZE])
>> +{
>> +	struct dw_dp_link_train_set *adjust =3D &link->train.adjust;
>> +	u8 v =3D 0;
>> +	u8 p =3D 0;
>> +	unsigned int i;
>> +
>> +	for (i =3D 0; i < link->lanes; i++) {
>> +		v =3D drm_dp_get_adjust_request_voltage(status, i);
>> +		p =3D drm_dp_get_adjust_request_pre_emphasis(status, i);
>> +		if (p >=3D  DP_TRAIN_PRE_EMPH_LEVEL_3) {
>> +			adjust->pre_emphasis[i] =3D DP_TRAIN_PRE_EMPH_LEVEL_3 >>
>> +						  DP_TRAIN_PRE_EMPHASIS_SHIFT;
>> +			adjust->pre_max_reached[i] =3D true;
>> +		} else {
>> +			adjust->pre_emphasis[i] =3D p >> DP_TRAIN_PRE_EMPHASIS_SHIFT;
>> +			adjust->pre_max_reached[i] =3D false;
>> +		}
>> +		v =3D min(v, dw_dp_voltage_max(p));
>> +		if (v >=3D DP_TRAIN_VOLTAGE_SWING_LEVEL_3) {
>> +			adjust->voltage_swing[i] =3D DP_TRAIN_VOLTAGE_SWING_LEVEL_3 >>
>> +						   DP_TRAIN_VOLTAGE_SWING_SHIFT;
>> +			adjust->voltage_max_reached[i] =3D true;
>> +		} else {
>> +			adjust->voltage_swing[i] =3D v >> DP_TRAIN_VOLTAGE_SWING_SHIFT;
>> +			adjust->voltage_max_reached[i] =3D false;
>> +		}
>> +	}
>> +}
>> +
>> +static void dw_dp_link_train_adjust(struct dw_dp_link_train *train)
>> +{
>> +	struct dw_dp_link_train_set *request =3D &train->request;
>> +	struct dw_dp_link_train_set *adjust =3D &train->adjust;
>> +	unsigned int i;
>> +
>> +	for (i =3D 0; i < 4; i++) {
>=20
> Shouldn't it be a loop up to link->lanes?
>=20
>> +		if (request->voltage_swing[i] !=3D adjust->voltage_swing[i])
>> +			request->voltage_swing[i] =3D adjust->voltage_swing[i];
>> +		if (request->voltage_max_reached[i] !=3D adjust->voltage_max_reache=
d[i])
>> +			request->voltage_max_reached[i] =3D adjust->voltage_max_reached[i]=
;
>> +	}
>> +
>> +	for (i =3D 0; i < 4; i++) {
>> +		if (request->pre_emphasis[i] !=3D adjust->pre_emphasis[i])
>> +			request->pre_emphasis[i] =3D adjust->pre_emphasis[i];
>> +		if (request->pre_max_reached[i] !=3D adjust->pre_max_reached[i])
>> +			request->pre_max_reached[i] =3D adjust->pre_max_reached[i];
>=20
> Why do you need separate request and adjustment structs?
During link training cr sequence, if dprx keep the LANEx_CR_DONE bit(s)=20
cleared, the request and adjustment structs are used to check the
old and new valud of ADJUST_REQUEST_LANEx_y register(s) is changed or not=
