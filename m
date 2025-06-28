Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E57DAEC4BD
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 06:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11F710E039;
	Sat, 28 Jun 2025 04:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vyfz+J3P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FAA10E039
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 04:00:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S2teMt026607
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 03:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=zvf9ppUj6F8YNp/HoveJCKlmtqHiQeMD/hZ+bilUb2E=; b=Vy
 fz+J3P8miqQ7t/+aL5MN8MroBYEmU4ql+20BC3waXYIifKmXtBAxDbE7j2CqbyXV
 LwiZyL+o81TDvc0WZlDOh/0CvW/Nzg7OyiGLHhWY7aXOFRUEwHu+NT0I5wCpOaig
 9SystzkgLX+T1tTOS/Q95un/o6GM37Pfj15ziE+koOQsC2Vv/qfV5nZ4ep3rgQZj
 feWd95qfXVQGfoGzVjyyPV73qYC75BCVJ2Dov2GXqVCsdpxaxvBYFbHkHxOpht0r
 R8qfW3We5sM4YsOBa1kOLPFydxxRF16bb5xYzomIcjaIqI9kQ9sbibq5INaTdxpc
 /IK/L0emk4aYKyfLSSGQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k0795-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 03:59:59 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-2da802bd11eso961214fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 20:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751083198; x=1751687998;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zvf9ppUj6F8YNp/HoveJCKlmtqHiQeMD/hZ+bilUb2E=;
 b=teLPn1heDAvl2YlkqUwupIAlonjwvvPcxBnTlBGgp/R+B3kGJO572snlTkBUxgi0dX
 qprvaJSUCztW487kNhb+EBCDM9N6Z1RW/UhIJ+LXNK6IEOEEZzYE25E0e+qScsRKW+/9
 BvWf99zgPTPfmBqbGMeJHJkUyE9K3k475hA3k42vWIPesbTaKTcMUBZSoNBRKcef2Zsj
 xwzIB7vfeRNoP8sCMi+xUUu4mxB3XFq8jFFZoOnEyavTIUU9NpnxKYrwu08dqoMTkM1l
 UfDMdTliZWRavxgf6JE7C5tOe/3QJaIcZGwnJycurdrxuZIFsvz6+zhwrohM12PWKul5
 jMWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqjj9gA7p7PckkH1N6dvVYHP8/fkDTTxueeExHtxs0SCtqY2gkuqDttWe8l2CZVcoQYE6yB47G7XA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySsktlmrOmxoxu8YCKibyheRK14mcvknojDaL7IlAIQcGEIfY9
 xqHM1WzgOJEtBqSny3ejTEVUKzYZ901cIrLVci5pO7nxElXT4z5kOdJm0QXAE7Ma3QuLxLZ0hZW
 jTV1wGh/ZFYLGxZ1nCX5DrE4iTYYO9PRXpZC+gzdZDwcsXFi9YSQj5eQKrsxSaaydVXgit5jVjc
 AyEzITplXzbDUAfIxSunJ3vsrYN8phsmIoL3mtwKFLYsmCGQ==
X-Gm-Gg: ASbGncv2yIrgM9VI56+8HiZQe+BEy19+GkT08kkPSwWILnhYjYKsllu5sqBOwRB4KyX
 XeR2CBTEaOZ2iVi206L9c0X/DqcBDGs/TG8Ju51e9wE2Uu0OYBev+c5EEsZDzPUUxQnrW1BRaEC
 8qGUv+xmEGdecDH7e9Klas33PejXYfJeGYQqw=
X-Received: by 2002:a05:6870:85d0:b0:2cc:3530:d313 with SMTP id
 586e51a60fabf-2efed684547mr3381067fac.25.1751083198449; 
 Fri, 27 Jun 2025 20:59:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG07UzpZ+D6JCb2jHfZNGeMQ/Kfuq7IKnRyeJs8gLL1wBON/XUk5ny9SXbXsV4Qty1jv6PI/sxO0/uvr1j/2fk=
X-Received: by 2002:a05:6870:85d0:b0:2cc:3530:d313 with SMTP id
 586e51a60fabf-2efed684547mr3381051fac.25.1751083197946; Fri, 27 Jun 2025
 20:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240226132544.82817-1-jacopo.mondi@ideasonboard.com>
 <CAF6AEGvhjktN52k4_hJjz3mXTGJgH+QtK68yhFbsX45ukKnG+g@mail.gmail.com>
 <20250627180454.GD24912@pendragon.ideasonboard.com>
 <877c0xatmb.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <877c0xatmb.fsf@minerva.mail-host-address-is-not-set>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 20:59:47 -0700
X-Gm-Features: Ac12FXwmYamHcHQ72u1toAJIIz0k_SZ2IgX302BTqT0M5-TC5fb8Di5vkqP3R_Y
Message-ID: <CACSVV03Vk9MVrKc7y-w2xRDdonUaEi9Ywaupakqb57-9v=uetA@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: Add RGB161616 and BGR161616 formats
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Naushir Patuck <naush@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, libcamera-devel@lists.libcamera.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=685f68bf cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=20KFwNOVAAAA:8 a=P1BnusSwAAAA:8 a=ZjRaYm2IgVGhPE4A6A0A:9
 a=QEXdDO2ut3YA:10 a=P2XgnWxznO8A:10 a=1zu1i0D7hVQfj8NKfPKu:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAyOSBTYWx0ZWRfX3IX6We/8FYNs
 wfG35jfeafKZXtNuLLbvePlDHy4nzCctPl7MuqrCUClbRKdoVxFwi7W/WcctgTOCMFK57mb0XDy
 2tjmNfpqhNJO+IVNj1MN3Zbp6J7QgjZ55fMzcB22lma3bzwqozIznzeAyjAnNeG66qQzU5Q28Fw
 ZbY7cDIHH/LzPCteU1s63o5qjZnxmg6Tvb8h0/+yWMJ6wGd8plaIHe0j5L/GB5n8XyWRfereAgi
 3uyKc/Lrz5RNxto61Ob2WNCLphPa3MP+mJCz5CtRjPf9/baenSvF5OzDZXhon6sz/3lBfAJ5gp9
 op1DzhUwel5onilwK35QjMxTTytJ4N7sxsY/Sl3/CvX0txhXPIeneQNEMYKut+STVigdgveXUyw
 +WY1puYslsks1OpXj7sgG8ZLTlPOrWyml9ApAZ/G91N/SwKl4LGRPs09qP9SKqHG8rNfcsgq
X-Proofpoint-ORIG-GUID: 2gnhO-AIhQ1prP0XDXYi72fGdG45QXhb
X-Proofpoint-GUID: 2gnhO-AIhQ1prP0XDXYi72fGdG45QXhb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280029
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 27, 2025 at 12:10=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:
>
> > On Fri, Jun 27, 2025 at 09:39:37AM -0700, Rob Clark wrote:
> >> On Mon, Feb 26, 2024 at 5:43=E2=80=AFAM Jacopo Mondi wrote:
> >> >
> >> > Add FourCC definitions for the 48-bit RGB/BGR formats to the
> >> > DRM/KMS uapi.
> >> >
> >> > The format will be used by the Raspberry Pi PiSP Back End,
> >> > supported by a V4L2 driver in kernel space and by libcamera in
> >> > userspace, which uses the DRM FourCC identifiers.
> >> >
> >> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >>
> >> Resurrecting this, as it appears to have not ever landed upstream
> >
> > What are the rule is for patches that touch core code like this one, ca=
n
> > they be pushed to drm-misc by anyone with commit access, or do they nee=
d
> > to be collected by a drm-misc maintainer ?
> >
>
> According to [0] I would say that you could just push it through drm-misc
> since there are already a few review-by tags collected.
>
> [0]: https://drm.pages.freedesktop.org/maintainer-tools/committer/committ=
er-drm-misc.html#merge-criteria

yeah, should be fine to push to drm-misc since it has r-b's (not to
mention no negative comments for a _long_ time)

BR,
-R
