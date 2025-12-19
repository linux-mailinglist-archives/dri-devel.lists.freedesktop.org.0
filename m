Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0003CCFB31
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 13:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A6C10E44F;
	Fri, 19 Dec 2025 12:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cB7yQ9Lq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GU8wAKLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8BD10E44F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 12:06:07 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJBSK4H3999335
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 12:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=IzZI2a7rRCVL15CfB9tR9LFf9hfnkjtO41d
 ZrsPqj0M=; b=cB7yQ9Lq/yg53Z8nr3HzqlavFtAd25Rs04Uybg0kvQkuLc63HyS
 mGbcxFhTnnSmrGGdoZ4JhEkaDQkFWI71ZR3/Sl03omQWlKd7gocphpgwXWmZ3Ski
 +5I7TjQlC4Cu/odNcd0u8j8gAS7Mb5mLp/26Nrv7P38nXCbRvm7G62KqvMFubD+h
 GaQ4JxMamqU8jTk9V//9uGJdahNzwvOrHKa7KxOf6lN7Ffle3kOlAO6lj1xIHQpA
 ZieOQSR/2xtbPI4XCazFqrKzbGmgyK9efK8o/jmWsReMhIQ9guX+8GCZZnpRCA0Q
 sQHtS80pGFappFVIio04tiDhnDqJc1RRl6g==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r29jka4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 12:06:06 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-7880bda8e5aso24194487b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 04:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766145966; x=1766750766;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IzZI2a7rRCVL15CfB9tR9LFf9hfnkjtO41dZrsPqj0M=;
 b=GU8wAKLyZkMITKfjH0MCeiN48L0bdXer43IcKc8N3+Czj2BTgkG7M+QIq+XZVnSFH8
 FCg52jLhgM5WewFn4yc0keir3OGqg3P6e3/rHQwRqMQE+0rzXZAmQ1PS8cJxi31CyEnr
 7lmQmz5roDKDWNDZjEgf8Y6WAQa17rO5xQYP0aqmpSqPe5HLVOO2WbWObnZ9wehuRhcF
 T+vnELwEl1xZa6FM/3Cic7OCtlDvTzK9P+mQOOZJYUMZKDOSvv/zlqYpD/fIdr1P93OM
 T5pW563nsmljbwDWBFbFv3/vZyu3O5h/GWG0ZRvia746VKHReUxQzPINmkyvlIhrFoew
 s9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766145966; x=1766750766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IzZI2a7rRCVL15CfB9tR9LFf9hfnkjtO41dZrsPqj0M=;
 b=qNOzIoQ8qFkCMxBTPrHmk7Q8cWB6rap3oYwa9NlE4ucBF0iFQs1XtLZyLyXkOl1mcf
 icI2T3aH95R5wAQG6nDI+nG0HXL5YZ/ffWAFfRnxsKPgNpEFbQMvUB00SC7rNmKYX2eH
 f5hfPPghqyWJIBo6FGJh8sVp95tF9+8PQIsQSU8ic8vj2O6Y1+oolj+I8dgoWpisEKNF
 Fx41nzwuprVjsOmqGNKdJEg2gNkeHIRw7BU6T8FiDtsNWSz3aVyyF06qdonff3+dEG5e
 BVZri3wJU+ENHTE5Y/MI2iFzpo8DDThiMEyby64EMcIOoIJ+brsalxqR78ntOVC0V2zb
 6UeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiWNCwHtFL6JNUQJVTH7ylTMgwBpWTwOQ5AHxd+gaIDpmNX3f7obfVWG2lwPW5mNoQ4OrMChLArBg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFhILwvb1Q7ATVpKymj3ZW2gxt5P4XTuj0KXqAm4S5LC7EVMR9
 HlKU2gpwD+vYFk0+pBIlf3H4JQgjgpZBtstwZtKAciO10mjezEFizjGX9wMrVwgtJquNY9TegVZ
 SJqROEz8E2XnSYeaWvgMonmZh2y9H4oHVwJrP58LoiCD7JevE7Zyk8ObcRu+CgEfpGWQeTBk=
X-Gm-Gg: AY/fxX5xRp9Uu5XT6ZnETobMfHRryLo5OWVA4E1cpgdDmDm4np5wrijdxBztco1D3pm
 BmMVVnmkBuIoB0RgvxI/ZPc8EN3cmfm8MmYFqbFM7mTCPGR5x+Gl8zUnpw466s9ugHIHqDboQjF
 Fv47GTC51v3hlwMZdKx/ScaRpufmGEerpS9nBTTCMwsBkWiVuPcOOp4ZA5ChtCT1Jq9kpGlM3OF
 aatSmyDb/9UisE1i4ANJ5KFoAVSJdlI2vfh9MXMJi/yBNd3dY9Nqsy0ExFTMj6l9k4pc0BDCnB0
 /jZqAPdbQGdJup1CAnjBqMt5OyIKTPKk6wb9Z+aW3fRvCtBhgSbkB+eXYSkQm7pzWVcfXd97Hq1
 AhcxvlnEFseXYsXxlbo4/5UZyi5U/gdhBX8OuS2v95/SpTCdWVfQd2tuNGmsyTt0Mowo=
X-Received: by 2002:a05:690c:6f12:b0:788:1eae:3d7f with SMTP id
 00721157ae682-78fb41ee82fmr20049097b3.70.1766145965957; 
 Fri, 19 Dec 2025 04:06:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVUKSymR3id5+my9YAHLROv2LOA8PHDxmbDvRUDqXYMkV1DyoXnr4nuO8/Jg718H4lOaa92Q==
X-Received: by 2002:a05:690c:6f12:b0:788:1eae:3d7f with SMTP id
 00721157ae682-78fb41ee82fmr20048747b3.70.1766145965376; 
 Fri, 19 Dec 2025 04:06:05 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f37edasm210625266b.58.2025.12.19.04.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 04:06:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: 
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] accel: MAINTAINERS: Mark the subsystem as Odd Fixes
Date: Fri, 19 Dec 2025 13:05:59 +0100
Message-ID: <20251219120559.60710-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=OrQ8y/KjF2b52Z42pepnzJIGsTvgzBt0zknnPclnRfY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRT+nfHacbjEENJE+UJfAwvezLjldazQSLrWpM
 wfCdSpAhgqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUU/pwAKCRDBN2bmhouD
 194oEACJ0OCpm3VKKrUBljRA29g2YHeosnb+8JieIUND6E3gLEmw7qYK0eg4EZAQE4+BIwrwkxb
 f5VIGR4codnrZsMIPAF4XPaiyl2936HGQsgWCpMigBAPdJtm0dBMheW9PyXh0DrtZ/BZdJGy4kQ
 CJoOjpTX4q4/RyX2PPOamJcAlT5fYpf29R6RsZSAl4DDcOIvTEyBB0toZXzPHaicd0qgzIHCdlK
 oy2vr8EQXw1MSzN4xZTu90+IIzjHycaGYhj26pqIjW3oXVliyMEUMKeH8t7uYuFsuAYTs1rUx0D
 GQdeNx8CilaprzmAEo1cNLuL3pBU52DM0NDTw2rDdEBI5RSWf50ZWfL+ci4mRjKX2tsFIFpJU7L
 siggW+tptnYC0pTVyvyQ+OY9vah2QAglkEE0InSZD8SW7CR6yaw5qUXhvWURHYwDNafE0aczA7v
 qKo86dEHrRyB2TW5pqNAy+5hLTxA2kiGWZKlG+Goa04ayLT7h/wsFyVYGiCWNjlyqoT8njHN0w2
 SKauAtQHJiMCuo9/bIamYpNIwgme5TgJeVmJK+TUNj8Q61E+0hASmDZ/RDaubPYvqEsEsUYihPo
 7dh7sEt16PSHAaCHx2J2H6vQdrxazGbtLlYlpwWPINOHKjjilXaZcSBUaMOsa0PYEt7tqr2ShJl
 sJ5sX+vAMH7IJYg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P6c3RyAu c=1 sm=1 tr=0 ts=69453fae cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=e5mUnYsNAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=YL6Xjd1eAAAA:8 a=KJwMiqYiu87tZNhqNnAA:9
 a=WgItmB6HBUc_1uVUp3mg:22 a=MP9ZtiD8KjrkvI0BhSjB:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=yLS1KB8ZbIgHeRWbGdJx:22
X-Proofpoint-ORIG-GUID: 3JExfkIgr8zs9GdF3wDY0FSYnP3PFzia
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMCBTYWx0ZWRfX5n3TtxEbuG61
 7QAwgq3BZrhzkl4y28dYeAjDZ/IIv5KNBNoI93YCpZLrKHben6jZ4wGfwIWef6Nf9MFRiKv5RBH
 /urntnGTopCKAgSUDzGEskkjW4wADcZThbeLtY0iJDkNGb89WwQnxOWtMyZ0rnj4zew6iDdxQuI
 M6J9zmo7do6ai+1oMH0JT59KHMiYtrjqyGR/EE3KgjC7/lUsHIfAEjdeIy00fJYVYLbVTxfx0Er
 AF1uRs6GNpiJ64ACuE4wZx27U113CPeMJsmgbQB9/3FX6kx/iTJXBKeX1PCfZpXWAwSWZHvObcW
 G+HRbMt5VPNycAJQ473Mu4eG1Sf9pWdgZLBClq3Nl6AeZEl0wIz3jROHi9C9lHxODur4NbarAva
 tXJiDwS1bDYtCBnqrrMENA/8xB/1DZLhxwDbejGioje+So8CEmwDpIEsVLjuScr8rCfH6BsurXO
 D07qw5Ibb5NnvD8IKLg==
X-Proofpoint-GUID: 3JExfkIgr8zs9GdF3wDY0FSYnP3PFzia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190100
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

The git tree mentioned in MAINTAINERS entry for computer accelerators
was not updated for three years (last tag or branch pushed is v6.1-rc1)
and is being dropped from linux-next [1], thus should not be considered
official maintainer's tree anymore (patches appearing there would not be
visible in the linux-next).  Also, there were not so many reviews from
its maintainer [2], so it seems this subsystem could use another pair of
hands.  Mark it as "Odd Fixes" to indicate that subsystem could use help
or is just not that active anymore.

Link: https://lore.kernel.org/r/20251215184126.39dae2c7@canb.auug.org.au/ [1]
Link: https://lore.kernel.org/all/?q=f%3A%22Oded+Gabbay%22 [2]
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0dbf349fc1ed..d97e5b41b998 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7740,9 +7740,8 @@ F:	include/uapi/drm/rocket_accel.h
 DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK
 M:	Oded Gabbay <ogabbay@kernel.org>
 L:	dri-devel@lists.freedesktop.org
-S:	Maintained
+S:	Odd Fixes
 C:	irc://irc.oftc.net/dri-devel
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git
 F:	Documentation/accel/
 F:	drivers/accel/
 F:	include/drm/drm_accel.h
-- 
2.51.0

