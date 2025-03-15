Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D0BA631F0
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 19:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBC510E058;
	Sat, 15 Mar 2025 18:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFV80jZs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4A010E058
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 18:52:17 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FINpDs015092
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 18:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bnAncL5kD4eXxNvWCFFrvQ6U6Ums7hNryPh9wSWW4XE=; b=CFV80jZsad71JrES
 QALfxZ3hp7Jx74pc674hSKMXXhijKXN655ivoDgrPprQWbpr344KIOwkI7992CY5
 XhYdLKuZKzxjFO+Vuh2akmwCflxOEcXr6dU2O1qDgkgdNo6OMWymtzZfrGKU0IcV
 4PCwH/WartZl1fCdSabMwzBClBbICAwZw6FNlQDXXIXFh39m/hGysgMbXIiWXKMA
 AmTKtACMsqMumRZ4nXiDpFmFlL5FEoAWgIxBYszZwvPWvQKPOVn17QsPauWNyha9
 NWHyf7wVRosvHYbOcYM9NXs2uNdQrqWirh4h3Z+vIOc685sVAhteb8Rz/2cuqIzW
 oy9aaw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2u9s1gg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 18:52:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c548e16909so318912885a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 11:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742064730; x=1742669530;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bnAncL5kD4eXxNvWCFFrvQ6U6Ums7hNryPh9wSWW4XE=;
 b=kKhBTy/43FehgGR5kT4R1yPlIITyFeDsfkLmKYohh5je+8SMV6Kqoei0/IdUQrS+0G
 lsQ3JblSguQiQj/VghJRLKRIMOW5u0SQL/VBGPEhe58ZBczWE+mSkOI4nWwIaE+G5rAL
 yATkhJVdAj+81A3kma7GIhZ6aSSZAVGOmA3+EjHVWzsVs0rf+MlpFIth9Jl/hGnXvVu9
 +IkuUJ/dTfTVX7KfZ/M9WCtxrugBQu7NbD26/4iEhiGpd9dD+ZMWD4tClDranmud1NEh
 o+LfHjy1KiWm06pWazjuWwVd21y8aWVFRycdfPVYsoOSCqzV2SC17Hmq47A5jxgcO7Wb
 FTHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhl795TuH8A2UCPDKL2p2+q+xbbamvntTx/z5yQParg9MmGCYfwCb/zPkpgfpNJ1yM8nBTJ8Lt9Po=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMxQ6U9jLvH1nQbUZYtBB8K0m15SpCrikgOHuOXbOPaIefcEyT
 YNn6GNdt8JEr37Z3RAht9YrwNDqZdWVxj26pQ6M7ghN5FRnnygetjn9YzBlLXActyYgvzCMRnZH
 NG9u52dXx/G3mlJ0xiqy/L08a/ZuGEUhfMt5hxferCqJGeRV5GgF1iSgw7BvF+wCB0ycamZ7reP
 k=
X-Gm-Gg: ASbGncteryugb69MLJbhLqDtIYlCXUqwrw71nIx/Oyyw6679+Anf9TmzcoGn+Ii4ZRL
 6e+uXEu5doCJsSBkGOyoYIWd5Q8FDTeCqU6dyxhVvWmJdha7nb8OvG2TaerasVbWQSbJZ/yBuJU
 DluoDXXB9jk7cb//5wBQIohxDh9Cc4mexnThk8PhRA83Xu7GYw5Kv2q5w9D7QD1WRDwUh+LCRqq
 O8UzjH7Zq6BqCAynY32BuNveRIphB4KDG6NLyJcq8yxkxe3dVbMwDKf1I0pOvnq+EEgPlPgjRXr
 iPxXI+pNV86kjgyPDvByk5+lZVk8WkyCpFvJxpwuf+J9fatGAy6XikhCVIL++L/vTkUbkh1HrZK
 55HQ=
X-Received: by 2002:a05:620a:1b96:b0:7c3:d75c:cc45 with SMTP id
 af79cd13be357-7c57c8ab6b3mr1110348485a.37.1742064730311; 
 Sat, 15 Mar 2025 11:52:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtHCMzbX0OB2KOgimxI9Ol//4ymRD6WnvXtY64Y19u+YoaCQn8CwG54zz/CRIZ3b8Uf85hxA==
X-Received: by 2002:a05:620a:1b96:b0:7c3:d75c:cc45 with SMTP id
 af79cd13be357-7c57c8ab6b3mr1110346185a.37.1742064729943; 
 Sat, 15 Mar 2025 11:52:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7c0748sm867889e87.75.2025.03.15.11.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 11:52:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 Vicki Pfau <vi@endrift.com>
In-Reply-To: <20250313211643.860786-2-vi@endrift.com>
References: <20250313211643.860786-2-vi@endrift.com>
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add ZOTAC Gaming Zone
Message-Id: <174206472636.769842.5163527184017187110.b4-ty@oss.qualcomm.com>
Date: Sat, 15 Mar 2025 20:52:06 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=JsfxrN4C c=1 sm=1 tr=0 ts=67d5cc5c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=f9SHwHToUG_3Y9A1ZWAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: hGdva4YMFzXdovsvihSO4-lKX8HDeFqC
X-Proofpoint-ORIG-GUID: hGdva4YMFzXdovsvihSO4-lKX8HDeFqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_07,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503150134
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

On Thu, 13 Mar 2025 14:16:44 -0700, Vicki Pfau wrote:
> Add a panel orientation quirk for the ZOTAC Gaming Zone handheld gaming device.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm: panel-orientation-quirks: Add ZOTAC Gaming Zone
      commit: 96c85e428ebaeacd2c640eba075479ab92072ccd

Best regards,
-- 
With best wishes
Dmitry


