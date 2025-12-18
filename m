Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAE7CCD574
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 20:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D64010EB1E;
	Thu, 18 Dec 2025 19:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DIC5h6JW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OhrT998/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A4F10EB1E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 19:10:06 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIIsukN754700
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 19:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dIw8j365ikKyDlsgwjx4WaIiStWEnX4+clh7heSJnj8=; b=DIC5h6JWngJRQiGO
 4a3tmpai3afMojQofFnHVDy3lNKG6BpZGEUzjmcp/bpe8UaN35zK+SPt5D/GO06E
 4ABE1JP940T2DYzfqgEtNUcI7hnyXEpArjvRgANwTV489DM4qv7YGPvynME79vj3
 Cxc/e2h3UtZMqPbr+1sFIU69sYcVBo8zLjhTk2qml3gR4yvc0HIFxWQIbP4B/KOO
 AShzwNTyQQPr5ZiODW8O72sR913m4eszaGMLaEU6o6sNSEVoc2FA9WphrjVFKDZF
 aTFjkkVZOicAJHjBiiBeHgIpLFpkY8EjO5SJv9lanMvDo6gV2dLohtyqR+cwNXcr
 eT4GgA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b49v0ttxh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 19:10:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8804b991976so21298316d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 11:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766085005; x=1766689805;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dIw8j365ikKyDlsgwjx4WaIiStWEnX4+clh7heSJnj8=;
 b=OhrT998/XYI+/kMpuKqbf0DVph13cUamYPUvrHnkCr98/ade12b7h94zogSSxyIEYJ
 PlE9VVyukXxDz41sXLhDklAXEpklAzgTglkkoqPPJ6ZqilGnQj7h5OtmPjLgQVU08iwi
 OCT8Mx8V7LAZGSdxrZNaZCotQEBWGSBGYYVSKpf0waPBxDz6NvFJ8GgPuiaXHfx/XY9N
 Nt6nRRTmkhMe5x5WJny7aL5VNWeVdML/V7R7/O36LAr22Es7XHHJz1UZhh5WkHQiJkTq
 CFv58Vga4Qreupcawk3xYWfmSTH8XDv7X2X5waTyBGOifFo2P6D3M7jY58VAeXVFJy8Q
 qnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766085005; x=1766689805;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dIw8j365ikKyDlsgwjx4WaIiStWEnX4+clh7heSJnj8=;
 b=VEdj/WWtikzlt360cCrjrIGCQiqt3lQv/GgB/qZ7qpbp/vbFSnXU+Ke4jjUaAf5hP+
 zLu5OgP1MA/h8mOP+V9BiN3NKhfLnNuVrnvyOcH2r0dBBdKU1qrn3NWpAvgo71WLgjn+
 4aw+kut4/b5GZndxW8v7HZJB7FCcPjZ12QDaAQQNNIVAOmFRFHYjtTut8jv+brDdBMQN
 hZMunCl+Ejpp90+HhW1Q4sMfsh5Jc6C59iVdg+1lkaBxSDJK3r9UDtJc5nWZ++BbEPzl
 hqgcqB07vTaMvF0RdNdAVwdkEKbsLrWsrmv5Gp0F5RM63szMjiQkIGUWaFnUAx294F02
 LXfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsBoxsjI/xgfQ9uPohqUs+4uVUxjlA4QqVgV/4YpVnJBJ2B1SPRqqvyjrTlyFAMhFiuviS3jNUkG8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxgn1AHSCBN0GyIL/srYJHePL5U4PwCeo5CMm+HrloRIdzy5eBt
 Am6nhZDIE3Jxwuzej6fe3UAK8g2x0neabXp0MrP59WBswTOacHhGPkKGSr1iaEV5c5DdExF9rV7
 8DJo5KU5C1A8lmd7SojN5NgQ3InscQaqgetAecVGAbOFPpn2XI2EGIsi6Cm1J1lCF8hLgM6+GUB
 tHTRzGIlfU1RkQwJyw7VuSc3pDY6FaBiMc7ZZMwH0rpr8pCw==
X-Gm-Gg: AY/fxX4ub2joKbDbwgpUUPPP3QEazdeiXuGtiOkpTQjWfkiGNjP7UWzKWpPLf2vcdZX
 5uS/1As2XCHBuKlSc37sjfi6uzUyDc4X1U2Ll9F3JhRgec+6hJaX3cpI8RZUtZT5Fp53NUXcWnH
 Og+WmOgxsW4/45COgjBEPjKB1JAR8IgqoLgs65MmYKP6eePpA8qLCZdxItKu9GkW8NO+um786J4
 M3/DUdKMaA19udQRSxt4q3SEQA=
X-Received: by 2002:a05:6214:5903:b0:88a:32db:ca2e with SMTP id
 6a1803df08f44-88d8859d814mr11385576d6.66.1766085004802; 
 Thu, 18 Dec 2025 11:10:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElTYAdoPhfH6LxXjgHHJuq9GB+MaXPuKPdY6tm4KOAmStZEaNhs0H2TbaWVu8vQa2PTPIgBrIHJI1918I+nRU=
X-Received: by 2002:a05:6214:5903:b0:88a:32db:ca2e with SMTP id
 6a1803df08f44-88d8859d814mr11385106d6.66.1766085004406; Thu, 18 Dec 2025
 11:10:04 -0800 (PST)
MIME-Version: 1.0
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
 <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
In-Reply-To: <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 20:09:53 +0100
X-Gm-Features: AQt7F2r9lOf3zDCFBlKxs8sdhKMbeErBZkq0-ox7XPW2t1SLGzCNcjhrK8xkLWc
Message-ID: <CAFEp6-3mHFYFPS=iakDyWUknDH8z4qOaHwFLuP=Qz1PvYSL_XA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] net: qrtr: Drop the MHI auto_queue feature for
 IPCR DL channels
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxim Kochetkov <fido_max@inbox.ru>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: f9Pwt8wykd0AaoyteV1pHo9Mtk8BFmox
X-Authority-Analysis: v=2.4 cv=Q/HfIo2a c=1 sm=1 tr=0 ts=6944518d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=isMaZ9OHK7bkWVW8W2QA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: f9Pwt8wykd0AaoyteV1pHo9Mtk8BFmox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1OCBTYWx0ZWRfXzYIjV16eLg9+
 gwDgofydADn143QegmDRzV0ZHcHNlXHNGrzP8tABLPiP41xX1DtcaHWVlzwAEqG8kGp2//QidGh
 Tlz1Bj616N8Z/rKPxFXoxzCbNzcoQuVBaoQA1ru3Ealx8FL1nLqCpQGUcAOT9ge70DGvVfaPAeF
 cCcNLFT5xjsVXkNyrl2yMUtgbXSPL8yMa/iie8cPP3NCpPmRjCSCkogaatlH1yqaR22A9BrtuJB
 mfFiP011cNKeP8RjVv0o3jUrOk4LWhruR8VKFyr5o1GmtBRtEgg07IFF1ESi5DgmMy7VrkWjqFr
 ZjForq7jJ7w6jmZzMnCS1HC9q6xwvP/sKSPDQpKTGtY8F0V6bgAU4QPrsOcS3VOJgbCZtELhBms
 Q//ZFXUUlv7mNc0hDLXTUXOgOUGXlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180158
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

On Thu, Dec 18, 2025 at 5:51=E2=80=AFPM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
> auto queue the buffers for the RX path (DL channel). Though this feature
> simplifies the client driver design, it introduces race between the clien=
t
> drivers and the MHI stack. For instance, with auto_queue, the 'dl_callbac=
k'
> for the DL channel may get called before the client driver is fully probe=
d.
> This means, by the time the dl_callback gets called, the client driver's
> structures might not be initialized, leading to NULL ptr dereference.
>
> Currently, the drivers have to workaround this issue by initializing the
> internal structures before calling mhi_prepare_for_transfer_autoqueue().
> But even so, there is a chance that the client driver's internal code pat=
h
> may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() i=
s
> called, leading to similar NULL ptr dereference. This issue has been
> reported on the Qcom X1E80100 CRD machines affecting boot.
>
> So to properly fix all these races, drop the MHI 'auto_queue' feature
> altogether and let the client driver (QRTR) manage the RX buffers manuall=
y.
> In the QRTR driver, queue the RX buffers based on the ring length during
> probe and recycle the buffers in 'dl_callback' once they are consumed. Th=
is
> also warrants removing the setting of 'auto_queue' flag from controller
> drivers.
>
> Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
> So only the QRTR client driver requires the modification.
>
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffer=
s for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation=
")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldcons=
ulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/.=
..
> Cc: stable@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
