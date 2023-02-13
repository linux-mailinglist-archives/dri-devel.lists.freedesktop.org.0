Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FC86943B7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 12:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0216210E541;
	Mon, 13 Feb 2023 11:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFC810E541
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 11:02:22 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id jg8so30861323ejc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 03:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=70NMlQcw2iBDbRyN8g9R2UaDW8v0WsBUWLxPKnQsybw=;
 b=c7+dVyzFuA7FINtkSmjmxRUKSB2Bl19v2Vt3RFREtrf0BounA7cRttqNJLgOoW3+ub
 aX+Frz6guaGOHS2YiK8mYQyzthBjzxt+Yh01a9Q0SprnC7pXvfGaF2tMWf77AnWfmvVd
 Ya+doB0PJj6PpjMpGEF6tq85pWy++zHQlz1pmF94OnyNLjqnbo0MA4JJRVJY9hUXzHLq
 wL56JmJbnZb4Eu0Rv6bZnNity5ZbCzS+QBldrB83Z2d7HhS+4sgxakPsPfqCC/fRcUPw
 FVlkQjmuW+TccEtYrQP3E/L2z+r8MYnIuBK6R+wYShX9tSgFQMWhGcyAdgfjBCGzaZ3i
 cFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=70NMlQcw2iBDbRyN8g9R2UaDW8v0WsBUWLxPKnQsybw=;
 b=0U1xRXLiLnHjzKD2ptXQmfXubVDB++8XiUDwZTl5/v0WMFpjXKSGZwVfkwx5AZofks
 6at9tBEkQfsVhccuMFMl9pIEkG81H2wzIMRfgk4EQxo68HqZw1JCfy/9d8upstExEyto
 c8jNxnjaO53YhbKQK5VQJTDVAflFofa/y9WZWgIH4GujSajlePmSAfT+dhwuHwuoSJsN
 yT6JBk969lyWeKdAPESXNN8bEGQHE/4MHr0bHN7z25icPLCKYUKw8autPcjUMG+ckIl1
 ky91yfk6bYQqGeFrVJ2IntYCuA54Ei7WD1QTkmerA0jgr8ckMMJrRJ7DvcTzcV5Fveb3
 3FUw==
X-Gm-Message-State: AO0yUKXezdLAE9soUyR2URTqdIQYJSMdQlM9/+IkXO97M4MdjVYXsVer
 J0zK0BZPgGwDtaKzB0znAtW6UQ==
X-Google-Smtp-Source: AK7set8cYRCrSRY/vmPzO6qb6ELLhtVHAtQS9hVUyeOcISQNnglfyNIgD+XLwVGCSteK3zVaYKevDw==
X-Received: by 2002:a17:907:8686:b0:8aa:be85:fc56 with SMTP id
 qa6-20020a170907868600b008aabe85fc56mr28490957ejc.47.1676286141103; 
 Mon, 13 Feb 2023 03:02:21 -0800 (PST)
Received: from jade (h-46-59-78-111.A175.priv.bahnhof.se. [46.59.78.111])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a1709063cf200b008af4dadd9c4sm5217871ejh.116.2023.02.13.03.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 03:02:20 -0800 (PST)
Date: Mon, 13 Feb 2023 12:02:18 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
To: Cyrille Fleury <cyrille.fleury@nxp.com>
Subject: Re: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm
 from a dmabuf file descriptor
Message-ID: <Y+oYundNEN9TDiQ8@jade>
References: <20220812143055.12938-2-olivier.masse@nxp.com>
 <30534fadb8172088eddef46ae71d87c167cbf32e.camel@nxp.com>
 <CAFA6WYOMCswgHHxsgc9Hgi7rmTPaZDqce=BixvYoFTfL0bTFDQ@mail.gmail.com>
 <PA4PR04MB75204E8D2B959893A04D55F388D69@PA4PR04MB7520.eurprd04.prod.outlook.com>
 <CAFA6WYPGT8xZnB1idcxcHT1bvM=0kwFssBQbn063-qg=czM-ZQ@mail.gmail.com>
 <CAN5uoS8XgvAKVwKHx-uOe3hAa4Jrd5FJt6xNOG5s-simkRND9w@mail.gmail.com>
 <c86d1a46af6e076038b3f0c2dd68213ff1e8b254.camel@nxp.com>
 <CAN5uoS-A8EovbnxvcXqiYHcy95d-PTYUZvnNr3=kf84AGkG8Kw@mail.gmail.com>
 <f3ccd7ad-0bbb-be39-c989-765552e2c6af@linaro.org>
 <PA4PR04MB75207FF08A6C2EEC1944FFFE88D79@PA4PR04MB7520.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PA4PR04MB75207FF08A6C2EEC1944FFFE88D79@PA4PR04MB7520.eurprd04.prod.outlook.com>
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
Cc: "sumit.garg@linaro.org" <sumit.garg@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 =?utf-8?Q?Cl=C3=A9ment?= Faure <clement.faure@nxp.com>,
 "fredgc@google.com" <fredgc@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "afd@ti.com" <afd@ti.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Olivier Masse <olivier.masse@nxp.com>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Feb 03, 2023 at 02:13:53PM +0000, Cyrille Fleury wrote:
> 
> 
> -----Original Message-----
> From: Jerome Forissier <jerome.forissier@linaro.org>
> Sent: Friday, February 3, 2023 1:32 PM
> To: Etienne Carriere <etienne.carriere@linaro.org>; Olivier Masse <olivier.masse@nxp.com>
> Cc: sumit.garg@linaro.org; linux-media@vger.kernel.org; fredgc@google.com; linaro-mm-sig@lists.linaro.org; afd@ti.com; op-tee@lists.trustedfirmware.org; jens.wiklander@linaro.org; joakim.bech@linaro.org; sumit.semwal@linaro.org; Cyrille Fleury <cyrille.fleury@nxp.com>; Peter Griffin <peter.griffin@linaro.org>; linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org; Clément Faure <clement.faure@nxp.com>; christian.koenig@amd.com
> Subject: Re: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm from a dmabuf file descriptor
> 
> On 2/3/23 15:12, Cyrille Fleury wrote:
> Hi all,
> 
> >On 2/3/23 12:37, Etienne Carriere wrote:
> >> Hell all,
> >>
> >> +jerome f.
> >>
> >> On Fri, 3 Feb 2023 at 12:01, Olivier Masse <olivier.masse@nxp.com> wrote:
> >>>
> >>> On jeu., 2023-02-02 at 10:58 +0100, Etienne Carriere wrote:
> >>>> Caution: EXT Email
> >>>>
> >>>> On Thu, 2 Feb 2023 at 09:35, Sumit Garg <sumit.garg@linaro.org>
> >>>> wrote:
> >>>>> Hi Cyrille,
> >>>>>
> >>>>> Please don't top post as it makes it harder to follow-up.
> >>>>>
> >>>>> On Thu, 2 Feb 2023 at 13:26, Cyrille Fleury <cyrille.fleury@nxp.com
> >>>>>> wrote:
> >>>>>> Hi Sumit, all
> >>>>>>
> >>>>>> Upstream OP-TEE should support registering a dmabuf since a while, 
> >>>>>> given how widely dmabuf is used in Linux for passing buffers 
> >>>>>> around between devices.
> >>>>>>
> >>>>>> Purpose of the new register_tee_shm ioctl is to allow OPTEE to use 
> >>>>>> memory allocated from the exiting linux dma buffer. We don't need 
> >>>>>> to have secure dma-heap up streamed.
> >>>>>>
> >>>>>> You mentioned secure dma-buffer, but secure dma-buffer is a dma- 
> >>>>>> buffer, so the work to be done for secure or "regular" dma buffers 
> >>>>>> by the register_tee_shm ioctl is 100% the same.
> >>>>>>
> >>>>>> The scope of this ioctl is limited to what existing upstream dma- 
> >>>>>> buffers are:
> >>>>>>         -> sharing buffers for hardware (DMA) access across 
> >>>>>> multiple device drivers and subsystems, and for synchronizing 
> >>>>>> asynchronous hardware access.
> >>>>>>        -> It means continuous memory only.
> >>>>>>
> >>>>>> So if we reduce the scope of register tee_shm to exiting dma- 
> >>>>>> buffer area, the current patch does the job.
> >>>>>
> >>>>> Do you have a corresponding real world use-case supported by 
> >>>>> upstream OP-TEE? AFAIK, the Secure Data Path (SDP) use-case is the 
> >>>>> one supported in OP-TEE upstream but without secure dmabuf heap [1] 
> >>>>> available, the new ioctl can't be exercised.
> >>>>>
> >>>>> [1] 
> >>>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fg
> >>>>> ithub.com%2FOP-TEE%2Foptee_test%2Fblob%2Fmaster%2Fhost%2Fxtest%2Fsd
> >>>>> p_basic.h%23L15&data=05%7C01%7Ccyrille.fleury%40nxp.com%7C9ff962fb5
> >>>>> 8f6401c597808db05e2a64b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
> >>>>> 7C638110243232457377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC
> >>>>> JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=
> >>>>> UNB88rvmhQ5qRoIGN%2FpS4cQTES5joM8AjoyAAYzPKl0%3D&reserved=0
> >>>>
> >>>> OP-TEE has some SDP test taht can exercice SDP: 'xtest 
> >>>> regression_1014'.
> >>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgi
> >>>> thub.com%2FOP-TEE%2Foptee_test%2Fblob%2F3.20.0%2Fhost%2Fxtest%2Fregr
> >>>> ession_1000.c%23L1256&data=05%7C01%7Ccyrille.fleury%40nxp.com%7C9ff9
> >>>> 62fb58f6401c597808db05e2a64b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%
> >>>> 7C0%7C638110243232457377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA
> >>>> iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdat
> >>>> a=e%2B40rwWvtvVFG8aWZNeu%2FgjMXXvZ3pRhJfHLkdurovs%3D&reserved=0
> >>>>
> >>>> The test relies on old staged ION + local secure dmabuf heaps no 
> >>>> more maintained, so this test is currently not functional.
> >>>> If we upgrade the test to mainline dmabuf alloc means, and apply the 
> >>>> change discussed here, we should be able to regularly test SDP in 
> >>>> OP-TEE project CI.
> >>>> The part to update is the userland allocation of the dmabuf:
> >>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgi
> >>>> thub.com%2FOP-TEE%2Foptee_test%2Fblob%2F3.20.0%2Fhost%2Fxtest%2Fsdp_
> >>>> basic.c%23L91&data=05%7C01%7Ccyrille.fleury%40nxp.com%7C9ff962fb58f6
> >>>> 401c597808db05e2a64b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
> >>>> 8110243232457377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo
> >>>> iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=5rPV1j
> >>>> qzqjVh2N5pdUW41YwF6EkgIDwfhyfYkgmtdZI%3D&reserved=0
> >>>>
> >>>>
> >>>
> >>> the test was already updated to support secure dma heap with Kernel 
> >>> version 5.11 and higher. the userland allocation could be find here:
> >>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit
> >>> hub.com%2FOP-TEE%2Foptee_test%2Fblob%2F3.20.0%2Fhost%2Fxtest%2Fsdp_ba
> >>> sic.c%23L153&data=05%7C01%7Ccyrille.fleury%40nxp.com%7C9ff962fb58f640
> >>> 1c597808db05e2a64b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63811
> >>> 0243232457377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l
> >>> uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=01H96n47K6R
> >>> mBKZQhRdcqX3nE5VBHOXNfGuMmmkVSvc%3D&reserved=0
> >>>
> >>
> >> Oh, right. So fine, optee_test is ready for the new flavor of secure 
> >> buffer fd's.
> >>
> >>
> >>> This upgrade need a Linux dma-buf patch:
> >>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flor
> >>> e.kernel.org%2Fall%2F20220805154139.2qkqxwklufjpsfdx%40000377403353%2
> >>> FT%2F&data=05%7C01%7Ccyrille.fleury%40nxp.com%7C9ff962fb58f6401c59780
> >>> 8db05e2a64b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638110243232
> >>> 457377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC
> >>> JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=yCS%2BDcuGp%2BafAL
> >>> tpw74O1bI0K%2Fwnt%2FOw5ob1ngfDA0E%3D&reserved=0
> >>
> >> @Jens, @Jerome, do we want to pick the 2 necessary Linux patches in 
> >> our Linux kernel fork (github.com/linaro-swg/linux.git) to exercise 
> >> SDP in our CI and be ready if dma-buf secure heaps (ref right above) 
> >> is accepted and merged in mainline kernel?.
> >
> >How would that help? I mean, when the kernel patches are merged and if things break we can make the necessary adjustments in the optee_test app or whatever, but in the meantime I don't see much point. I suppose the people who are actively developing the patches do make sure it works with OP-TEE ;-)
> >
> >Regards,
> >--
> >Jerome
> 
> As mentioned in the cover letter, this IOCTL got tested by Jens Wiklander <jens.wiklander@linaro.org>, using Linaro reference board from Hikey 6620:
> https://lists.trustedfirmware.org/archives/list/op-tee@lists.trustedfirmware.org/thread/I3TZN4TBDOUVE567VMMN2TAXGWZNY7S3/
> It also works on i.MX8M EVK boards.
> 
> My understanding today is we are good to upstream this patch, knowing:
>      - Upstream OPTEE driver should support registering a dmabuf since a while, given how widely dmabuf is used in Linux for passing buffers around between devices.
>      - review is OK 
>      - test environment is already available in optee-test
>      - it has been tested on 2 different platforms
>      - the scope of the new ioctl is limited to existing feature in dma-buffer
>      
> What is missing from this list preventing to upstream ? 

Please address the comments from Etienne and post a new version of the
patch based on the latest kernel. Please try to improve the language in
the commit message.

Is it possible to update the tests so this can be tested on QEMU in our
CI loop? That should help to get the review restarted.

Thanks,
Jens

> Who do we still need to convince ?
> 
> Regards.
