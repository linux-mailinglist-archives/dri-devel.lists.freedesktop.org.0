Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C44DBBCD99
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 00:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF5A10E2BD;
	Sun,  5 Oct 2025 22:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WO5WBtQC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C1C10E2BD
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 22:56:24 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595LqTn9018496
 for <dri-devel@lists.freedesktop.org>; Sun, 5 Oct 2025 22:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/2uWnsbMls6+QfRWazfnelee
 sfKUpBCdSUzAPjRUlew=; b=WO5WBtQC2lyJRDa48iufbKQXpx9qRCTfnUI7YPHX
 FGod74uBMBAffjikoeHvl75x7WDcOug3S7xgHpCBo/YFFOuVA/7AB5EXePa1UtMe
 gWeqhjhJzQJe6o/txjWH0kMzlyvlXzuWwPf5ygCvbeERR1DjxX9+wvjvPqkJtbWR
 JtG1bzMFzf8is2HErHJk9Qq4ZHqLcvcoFJLD8PD7F4dGsuvYUyCkFrN2bsEFwsr0
 N6pt1pxhuSVTYS2goX2i2Md8KRSUYm3ArzPx2HTNUHAogml+ZGV472c5nB9jorEG
 pzZFzKd+9GZCqx75nTyHeXFfyBdcM9DQzY1v5C5xviDvrw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvrhjdrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 22:56:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-872d2ad9572so949425085a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 15:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759704982; x=1760309782;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/2uWnsbMls6+QfRWazfneleesfKUpBCdSUzAPjRUlew=;
 b=j5azmJ4rHGQK1eikblKeZpXRYuxzzlUVEu4hqQMKKqyENSY06KKAS2zqSiReb17A32
 HJag4+x220Wvnzv0dZVVlaxbi7r8U8o1kixQET7LhWCMiqYTojVQr913q6WqLQwGqyj2
 WrD1Vj5YdSTlWnMdLkLElwHWx2ptvkty+P8m8/MJ5xHycUy+K2XaQHRJL8N8JpF8gvW8
 g/VrJWTmozB+G9XLYATK2qfiM7DmkZbsSPyKOnb4WzuAJvnF5Aac/o3zIksqDFuQLbmG
 kynhDeqClqPnDs/ECHJ9wzidViFMSV4gnsaD5vtE1T2GEbTdrmpxrTZZcqtRT/qJ9TYS
 t4Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPLZbYiizTtu3X7yPj1POUz82VxoGCJa7z1g8FFUUfhwDfRnsv4BALpzpBmHIQQOPzaJtwZ0o3Iiw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBkYN4cn4CehBKcs2VKF5v1c6D51qiKkpprX/uCEfPUgOHhfXY
 6IQCeZFtsFSbXHcE4UBQxnompSljYIFo5Oy6rjJ0OksaHSONokOneL5S+t3L6HWKJgarqi+E0AB
 UucuGPpM+T53IfyvQ2hQZ+9eXx9UkD3Wt8Xf/ZyZbPi1soaBGeHI4vDsFjZuT4TWqQfPJekE=
X-Gm-Gg: ASbGncs/rVoX0Dia9Q9F9knfC8XH0U3E86L5boaEFB1BYVV743TCRTIIWoD4URI9AbB
 gGnJ5uEg1ewKQXJpoN00ZkxSVLke1ifGsTx1zLeau+Gt57TD3RUk6JXWvdLv6E5/n4tqYQ2HzFY
 DEoNkoVFD/+gtdty4j+PTY2nuCXc/uT2wc8nMUYcPzWlN1uSKRms3PMbme/QiEY7Q8FDejGc+lC
 KkW4mdCIZRd/OYNshiLnquk/2KWQKUxGWQOFF47SWG6DZ4MVRawH+eYTbv51kxmRIWAzRH3bUID
 l14xhdMAXMaApj6iE21/3X7cgkLe72RVRIpOzDo/EtqhqgxPT18OhsqD95aa4N7ZN/dhxTATmQX
 DAAoZSScMg05ncyffmYlp7cQdqiTYyAu8V/E5Ca5HIFSU0yc17ram7nv4JQ==
X-Received: by 2002:a05:620a:254b:b0:858:fb03:1c36 with SMTP id
 af79cd13be357-87a378d2e96mr1325670785a.44.1759704982355; 
 Sun, 05 Oct 2025 15:56:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcLVQ1U2XzBgCSh16EAKCoHAqyRTinAFUHqmO6aWJdesSrBZJIUBhcSHx4M5aFBlxNaomGvg==
X-Received: by 2002:a05:620a:254b:b0:858:fb03:1c36 with SMTP id
 af79cd13be357-87a378d2e96mr1325669285a.44.1759704981901; 
 Sun, 05 Oct 2025 15:56:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-373ba4ce0bdsm39514101fa.53.2025.10.05.15.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 15:56:19 -0700 (PDT)
Date: Mon, 6 Oct 2025 01:56:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chu Guangqing <chuguangqing@inspur.com>
Cc: tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 0/1] [DRIVER] gpu: drm: add support for YHGCH ZX1000
 soc chipset
Message-ID: <z6olmcvc454krz6axhxcgdzhd2vvp2hsyruafnbqybtt6pxrwp@a4ozfscappnu>
References: <20250929063103.7375-1-chuguangqing@inspur.com>
 <20250929104831.8548-1-chuguangqing@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929104831.8548-1-chuguangqing@inspur.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNiBTYWx0ZWRfXzwwpGxymYTMK
 amknbjoKiMKChB/mBSQTMGeT5jJx5b93BWpwwz4Wx6PssYga+37SYhT1KahmLx19CVTVV2GmFa/
 2x6aZDtWnzCU3E2NoPMa2dvtpJ+/jCJqUsqzHsWp4uwSUweg4854EPb2b6kE2PrnCKwYXWWhbE5
 wpC5HYMQXTVP9HjMvR0deMkkkX2xjzw4tB2oC+JtVM4a1JOgFXJ8vPA33XMNRTozfg4HodZ2e3b
 QgIJOUpevKUsp5ku7wFvocc2adX1cdrRmD7DD8dMu2ZUtNChWxfOGeI8CCwM/oWXtuzAIG3TCnh
 Nkkrg1TigaJyEhm+KUzF47Piz5ArugqdG09yEkXqG5GPUqt37tyZkShuF3Kat6YfFoiIAXDOAjH
 q9oAlplvpAtihZ52I4xUaNoQksntsQ==
X-Proofpoint-GUID: G7bGmImNPCpWoe0o01HlPgzSZPiW957-
X-Authority-Analysis: v=2.4 cv=XIQ9iAhE c=1 sm=1 tr=0 ts=68e2f797 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=zYVcCjuztwTJQ5VsRzIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: G7bGmImNPCpWoe0o01HlPgzSZPiW957-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_08,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040036
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

On Mon, Sep 29, 2025 at 06:48:30PM +0800, Chu Guangqing wrote:
> v8:
>  - Use YHGCH uniformly and add the company's official website.

I think you were several times asked to stop sending new revision as a
response to a previous one.


-- 
With best wishes
Dmitry
