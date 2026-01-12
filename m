Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27815D1496B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 18:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED4410E296;
	Mon, 12 Jan 2026 17:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JRYKv2jg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XTIZeXZL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6851010E296
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 17:55:22 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60CHfIsJ1912178
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 17:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7wC12hIjapFHnxbTfyvh347loINH0/VC2F8iYpPdYKg=; b=JRYKv2jgb+iiZ3b4
 Kaiwf07C+GReQjrv69JZ+ClqMMhzeS+tTV3E98uX1wm1KYP8mlCNrIPpgOXbzlZt
 AzhpFu4YFTysSOsjNMbVpGkmEXUzqxiMyHUbMqgZoPsaQAE2l+RMGZaFdXoS+Ly6
 WBkVoNKwh4A035kNiyrFLCqcwiFT3GCkCvcJBTLCPvkkKNTb8r6EsEMMTU4xlSIt
 11DlBIaZe+yBhwZ1I4x5x4AhRXu361qGi7yXGIUK9IXtQFV4uaaQh9XFRenyO/gu
 VKqUhQyDwnxjovSzh7yTN66cHuDh8J/E3n3UoQLtQm0+b+cyGWf1E/UG72hCW2Pi
 mjRL1w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw1ywa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 17:55:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ffc5f68516so101227061cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 09:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768240520; x=1768845320;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7wC12hIjapFHnxbTfyvh347loINH0/VC2F8iYpPdYKg=;
 b=XTIZeXZL84BxgGvdkv7RZBfbS+8TWloNTMQTGA5uL3ahasq/Z5TwRp6EeBKrDYaS7v
 cSaiYc/idiGAAUiWRKPUgnqqsg+gqcYp10X9WelGvi7NjD7BfwYYshp7XQ0mLpqfZOsj
 +dkCXBUhCRKOsPH8QKBUUzTpawbqSXYfzdzAvT70cdyZrdVp+Q+yIul9+ynIazOXdEu3
 2xQRqFrDsHu3oCVgNOqAew/I4il4IJ4LXI3KTnRYTzK2OVUWsnqZp1vA7JEqW9oBbk7C
 nb0+SrONbDRRbXtVuGfSqEFK7ov6kbdbsl50nMeudAg3H/V8rUxx4orjp+E0hmYHbqBJ
 dTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768240520; x=1768845320;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7wC12hIjapFHnxbTfyvh347loINH0/VC2F8iYpPdYKg=;
 b=Ln29H7lMsiYyAbmiy7tbNpmV3/H66PqVxn+U3EveeEQH/HN/1Zzre3wviKyOC9BMJT
 ThW+FswoZ7TUQkWK0KztMXKLto9eGEUZQqIgSDEbYZEKLF4FOZ/2vxEMkFBMIhuNgMRh
 O7TJ5QaSzPgARLU9RYfwFrr44f1C+xfkJujgPxS0RUoe2B006WzbSYroy/julZBXtonD
 1ObTLSnbvo0e7gzU6wGS/AyI6U5/2rujjm9N1gLgq8UXfxqs6m7uQeVzSFJKrgbcEDh+
 L/qUJL2C1KwRN6n8xv24K7gE0K/LIlJDkP5LKj29mfMncoM94cOsOV4mImug8Z44/7n2
 lbxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8cCpe4r1mElJCaOSmYLSA+ktMetAul1PaBx3Al2gEZMuU00kUxEnRufD6mTApNeI4zn0Z98haekA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVtPWSR7W8t4g76L5tvVrXrgpBmfETSaYTFO/4zqv5r16bJA5Q
 65j4Prtig5/fJcMgmRaApMNANGferYRmi2D9ccf4j0+pAlBjucRR4wmecvj/Sf/nxCij9o+E4Pn
 BYTIWSESLh2vXip0PU/CbiMwM20qkHzRW+yEf2V3SodJveiYGIgwwPlU815U6xFglEqZ3NIZkdp
 dPuaC5UY1yeEI+DdH886DU+2pcak8ThLQ259RWsKNdA1sW14qKWybQXAksZ3R+BQ==
X-Gm-Gg: AY/fxX54JzEuDmcFDgdQROHIgThoJDaPMNb1ZtT6DQmqLalqneV86IQVdY4JYlsZcQL
 RHoqgj6ERVt6Dy+Aollb3+ya9RFBcrrVer3McNApz6t4ZhON7kaxcNRGVogjPRqFS6DsIqw9hDy
 LgVeYxZiWbjtzFrWTkJkho5pBXZkOrId5aCNilKh5D//XHy3YZ+Yaze6Rl7WyKO9Taakw=
X-Received: by 2002:ac8:7d12:0:b0:4ee:209a:a012 with SMTP id
 d75a77b69052e-4ffb493248amr239254721cf.30.1768240520406; 
 Mon, 12 Jan 2026 09:55:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkIE4UQiDWlGLDB5w+wYNs+Gn36BQ7I0jvQlIkWPIDFo+CJGqpd/klyc5izbasi9kBaeAa2piY49p4mUqvGPQ=
X-Received: by 2002:ac8:7d12:0:b0:4ee:209a:a012 with SMTP id
 d75a77b69052e-4ffb493248amr239254401cf.30.1768240519876; Mon, 12 Jan 2026
 09:55:19 -0800 (PST)
MIME-Version: 1.0
References: <20251224143009.2769836-1-youssef.abdulrahman@oss.qualcomm.com>
 <c0d07081-cb27-6c2f-604c-00f6f526a0dd@amd.com>
In-Reply-To: <c0d07081-cb27-6c2f-604c-00f6f526a0dd@amd.com>
From: Youssef Abdulrahman <youssef.abdulrahman@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 17:55:08 +0000
X-Gm-Features: AZwV_QgCA8afy_69FJDdsfDkXyaqRMMIpeabluPijgC7rXl1YMMaLtc1rcnrj-g
Message-ID: <CANyhwx0ts+Xx2mwEn+H6RkYgGzA=MS0e55+bmpceAOcWpcqPBQ@mail.gmail.com>
Subject: Re: [PATCH v2] accel/qaic: Handle DBC deactivation if the owner went
 away
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com,
 ogabbay@kernel.org, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDE0OCBTYWx0ZWRfX+HoL+EykKKiH
 8QgI0Vfm+AVLtf6aFNKXVpVjApztbBV0CmHBL6SqPFscKNa/wp9/y4t7LVsbBXZWJp1SvgbkKlH
 4QpVBQiajl6d+a1GyEiz7BgaQiBZXy7ftt2Osg5r+P2o9Sb3Fv2IP6E21whVQGtOFzIYE5Hwnt4
 jgimeclOpZSWwTIMvqK/r8kQtWXu6hbWd7QJlOjd2uE54fZ7MJa/Qd1ORx6sZVXayQNjhdwKdMe
 hdBtqLAzgbxI2Ac7oIyvWRBRe3A8CmQ51ODUVLioFsom8sfwJMwPNOVg+w+9MJsxnvCM65NcqFs
 dCNaeUgnVQhKeclSkJUR/kv1c5gLMFmZkeQox54a8lARa3AQY3SLPXMNMl8B/LRAJ6DrdZREukk
 LdfYvYo0RJcenpJVWeSFgAR/M6YjCsBxAMkb6KmrAddkJCZzkFfrbwhI3ap6uYWuNapn5s7/CFQ
 BSAU2vmPje7nTT3wUNA==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=69653589 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=zd2uoN0lAAAA:8
 a=CdaD7TzLHgGr7jEhopsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: r7TL-K8PrvQsr-um65hhO382zC0iGdL8
X-Proofpoint-ORIG-GUID: r7TL-K8PrvQsr-um65hhO382zC0iGdL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_05,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120148
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

On Wed, Jan 7, 2026 at 6:14=E2=80=AFPM Lizhi Hou <lizhi.hou@amd.com> wrote:
>
> > @@ -1108,6 +1108,9 @@ static void *msg_xfer(struct qaic_device *qdev, s=
truct wrapper_list *wrappers, u
> >       mutex_lock(&qdev->cntl_mutex);
> >       if (!list_empty(&elem.list))
> >               list_del(&elem.list);
> > +     /* resp_worker() processed the response but the wait was interrup=
ted */
> > +     else if (list_empty(&elem.list) && ret =3D=3D -ERESTARTSYS)
>
> Rechecking list_empty(&elem.list) can be removed.
Good point, I'll apply this in the next revision.
>
> And if ret =3D=3D -ERESTARTSYS, elem.buf is not NULL?
No, this check handles the case where resp_worker() is able to get to
the element inside list_for_each_*(), which will set elem->buf to the
resp message, at the same time the user interrupts the wait in
msg_xfer(). So, it will be treated as a valid response message.

- Youssef
