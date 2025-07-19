Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11721B0AF25
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 11:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C1B10E043;
	Sat, 19 Jul 2025 09:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9E9NDCO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5012F10E043
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 09:45:03 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J9UON1031305
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 09:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=R0sRSQm6QGldYU9cEcvu2UaM
 4oCZ6d5h4JpfdEInEJ8=; b=e9E9NDCOMkAo1RFfIPbiv8pnNNhg/5OMJLWFp7C3
 DqceBnVGb6VdB7PrrPA6b2CaLeh+Wko2ws2f6z9Q5BT8lFEtpvj9BcHQvyJGZmp5
 hRmvANy6TDjoVEdFXQweMZ6+CEyknAwVa8YdVwaY2Es3C5sAw9ACzLInjoHKFVkY
 2+3DshMPetj4hnMpAzJu3AZ1f0xe/fi6xeJuq+CshwJlmsL2L2EcUnun1R2wlcDb
 he09kOf+NGZX4LvZdT+Ri9FivAiDCh58q6WIUHXd8Q+Kzbg6sZVgpGFupj0jhwjr
 dzCmfAtJAtW6E6+QEn4zBVaKP7yBPIyY3nem2eYNgmiVvA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v0dvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 09:45:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d40f335529so613600785a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 02:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752918301; x=1753523101;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0sRSQm6QGldYU9cEcvu2UaM4oCZ6d5h4JpfdEInEJ8=;
 b=e6TZPqp+4fryuaSt3bHuC66/z747q0qY+1pQbKJOue8ktKGggqVCRBMmyx1cLCLl2b
 KSg91+fIHu5PILlfmbhYN0jtpfmcf7PVFBb8+mxHncs9jyhwMrPJOOjkK5JFphxP+iSA
 TOm9/GYMl3wZ25WKKaH0kzFo+kuOw0KVjrvTrUpfd3GW/QLdODHPumiyPeXYRPjfYBn3
 +ftU9TxipFPEimeWvEYuBL6bkdOjWdtMJSbFHU3Cs34y/KuMSVRGFktWwPffmfo+tU+N
 w5Zb4eM20NaQ+GaUV1kouQg2hXfo+z6+6AoqlGmASdlZvIaWO7yeEFshEDzXJYM8Jzsy
 LQgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk6gLYBm46jNWBdHQLhWqMXE0xE73HnbaKpLuciotJxuh4VlRJ1crSkxyfQxaKJbVHYbkV/wl8Bck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpLgE/cMNZjTD4k5aL6AN22FgH3kcsonQD8v5+w2HcavL5tTQl
 mSf8OWxa4K3q5Ypp0Bh5U/JvvPh6iH26SkVSn49H7GYwOI3vtBXr/HuN83DXng0Fuk4uMKX63KX
 HTHK6Fg9c+t6D9jeiQyVoqm5NrL7EDFjXSJjTKiIWGBZ8pMa4Qg18RuJ0I/Hf2ekrB1BAJYM=
X-Gm-Gg: ASbGncvdysoImVlHoOl4Es9CKVlftJ0ntz4/OuH+sRYxjJp2qPz8v8mVKRf8QjTZLzO
 2gTwupWJ68yYOXK4bggQBXxATkrSS45ObOTE6zkzRi4fRwusg19pKUHsIY0eFFPWSTn0LwyEbE6
 TBkRawZdVCmMXhE0xIq6W5JHaL8U1io4mMjM61vdl4Wm8kBYmxJrqOnu2cCHPKfHK6Zi4VoZiS7
 moJeIGhBcBxjafnkIhv3Bcdtw7a1GyM0FvVAkxsGNiHTZWbn2YVOlyTauqFUxjyN7OXVRRgaHzM
 ktYA78KIx5EiATeutPgRCcnLtSku9Nt2sFplQUw/IUR2VaoHSp7PO0Zx2ZIi9pEDGx/aOyNikEF
 /b0Opi+dHxrVBthUqh7DiaAm4740BlPzSqLAqrRleXvbTfzmJemX5
X-Received: by 2002:a05:620a:e09:b0:7e3:43cf:5a73 with SMTP id
 af79cd13be357-7e35557c7demr767059285a.11.1752918301207; 
 Sat, 19 Jul 2025 02:45:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPdP6NiZKgFvKPiQrN/esZZaRULd3fT9u4TcKGfAdnilezqUcW8siPDqSy3OKK9PIDQMg3ng==
X-Received: by 2002:a05:620a:e09:b0:7e3:43cf:5a73 with SMTP id
 af79cd13be357-7e35557c7demr767056885a.11.1752918300733; 
 Sat, 19 Jul 2025 02:45:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d8f936sm638066e87.138.2025.07.19.02.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 02:44:58 -0700 (PDT)
Date: Sat, 19 Jul 2025 12:44:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
Message-ID: <lmytte3p2eq7fsjsbogzrqjyimlw42v2x2zystx32nuvnm62yb@wzqrmhqcrzl3>
References: <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
 <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
 <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
 <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
 <qw64xqfnyy76f6oawtaecvraejcwyml5k7oxdy67adj2rh46lq@nupxbuy3vwu4>
 <7505f0e8-222d-4052-8614-c12109d14bce@oss.qualcomm.com>
 <cq3qfx32dallivdcwjwqgq7kggiwucpcyhwqqlbrf6n4efkmuc@htjwnigojag2>
 <8b877eeb-941a-47c5-a67d-450dfb772d6e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b877eeb-941a-47c5-a67d-450dfb772d6e@oss.qualcomm.com>
X-Proofpoint-GUID: HoFCka3tLayZCwPEoNQd2UGgZbKF8cP7
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687b691e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=QlMHoEhoFvJFoSiYPA4A:9
 a=MBxd-Kn_9RtsxwEB:21 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA5NiBTYWx0ZWRfXxbp/fZBOGslg
 9cQlpEgRtn3C0Vi8cdLtRP1lC1RNm4ixdaDBFH9vVgiqLuGn60axrQsJLPGMeyg5MPSob5Bgu5d
 0wJvkCqmd7wQdHBjifU7vJoOOI478czUMvEu4UFVmdTKC9MUwoE0dDrHIPWuRbbALZ4+WIMD8f1
 krV9WgQSmWENC6B+ZSA3kaOIQF21Y15jZv8pJLIncxz8VMeLUjv8d0k349oNiz7KGy14Z7bYdJ1
 bH7XmFRuy2hxdbzW6QEpR71JG9EJjL3NIGjj0XeXFcJxcNT+enrr0sel82SquZ1/WnrdZiRBB1h
 ZQ21TknOjjBshckmyHuzt1VjR+6N4wG+3/m3fuj/hBxViK5yQsmVNO6s5ClcxSC9LPfMVFk6lBG
 2MZyiPJFcB+iAA/GvxlWyRibGKVfagJXYCq+XMCeaGlovuCNmL2dUXnFD7k6MNLzZQQhTSkD
X-Proofpoint-ORIG-GUID: HoFCka3tLayZCwPEoNQd2UGgZbKF8cP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190096
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

On Wed, Jul 09, 2025 at 11:13:49AM +0530, Ekansh Gupta wrote:
> 
> 
> On 6/12/2025 3:54 PM, Dmitry Baryshkov wrote:
> > On Thu, Jun 12, 2025 at 03:02:52PM +0530, Ekansh Gupta wrote:
> >>
> >> On 6/12/2025 1:35 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Jun 12, 2025 at 10:50:10AM +0530, Ekansh Gupta wrote:
> >>>> On 5/22/2025 5:43 PM, Dmitry Baryshkov wrote:
> >>>>> On Thu, 22 May 2025 at 08:01, Ekansh Gupta
> >>>>> <ekansh.gupta@oss.qualcomm.com> wrote:
> >>>>>> On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
> >>>>>>>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
> >>>>>>>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
> >>>>>>>>>> User request for remote heap allocation is supported using ioctl
> >>>>>>>>>> interface but support for unmap is missing. This could result in
> >>>>>>>>>> memory leak issues. Add unmap user request support for remote heap.
> >>>>>>>>> Can this memory be in use by the remote proc?
> >>>>>>>> Remote heap allocation request is only intended for audioPD. Other PDs
> >>>>>>>> running on DSP are not intended to use this request.
> >>>>>>> 'Intended'. That's fine. I asked a different question: _can_ it be in
> >>>>>>> use? What happens if userspace by mistake tries to unmap memory too
> >>>>>>> early? Or if it happens intentionally, at some specific time during
> >>>>>>> work.
> >>>>>> If the unmap is restricted to audio daemon, then the unmap will only
> >>>>>> happen if the remoteproc is no longer using this memory.
> >>>>>>
> >>>>>> But without this restriction, yes it possible that some userspace process
> >>>>>> calls unmap which tries to move the ownership back to HLOS which the
> >>>>>> remoteproc is still using the memory. This might lead to memory access
> >>>>>> problems.
> >>>>> This needs to be fixed in the driver. We need to track which memory is
> >>>>> being used by the remoteproc and unmap it once remoteproc stops using
> >>>>> it, without additional userspace intervention.
> >>>> If it's the audio daemon which is requesting for unmap then it basically means that
> >>>> the remoteproc is no longer using the memory. Audio PD can request for both grow
> >>>> and shrink operations for it's dedicated heap. The case of grow is already supported
> >>>> from fastrpc_req_mmap but the case of shrink(when remoteproc is no longer using the
> >>>> memory) is not yet available. This memory is more specific to audio PD rather than
> >>>> complete remoteproc.
> >>>>
> >>>> If we have to control this completely from driver then I see a problem in freeing/unmapping
> >>>> the memory when the PD is no longer using the memory.
> >>> What happens if userspace requests to free the memory that is still in
> >>> use by the PD
> >> I understand your point, for this I was thinking to limit the unmap functionality to the process
> >> that is already attached to audio PD on DSP, no other process will be able to map/unmap this
> >> memory from userspace.
> > Ugh... and what if the adsprpcd misbehaves?
> >
> >>> How does PD signal the memory is no longer in use?
> >> PD makes a reverse fastrpc request[1] to unmap the memory when it is no longer used.
> > I don't see how this can be made robust. I fear that the only way would
> > be to unmap the memory only on audio PD restart / shutdown. Such
> > requests should never leave the kernel.
> >
> > Moreover, the payload should not be trusted, however you don't validate
> > the length that you've got from the remote side.
> I was thinking of giving the entire reserved memory to audio PD when
> init_create_static_process is called. This way, we can avoid any need to
> support grow/free request from user process and the audio PD pool on
> DSP will have sufficient memory support the use cases.
> 
> This way the free can be moved to fastrpc_rpmsg_remove(When DSP
> is shutting down) or during Audio PD restart(Static PD restart is not
> yet supported, but clean-up can be done when PDR framework is
> implemented in the future).
> 
> Do you see any drawbacks with this design?

I'm sorry for the delay in responding to your email.

I think this is a perfect idea. Can we be sure that there will be no
extra requests from the DSP?

> 
> >
> >> [1] https://github.com/quic/fastrpc/blob/development/src/apps_mem_imp.c#L231
> 

-- 
With best wishes
Dmitry
