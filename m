Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A95AC6DDAA4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 14:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CDF10E2ED;
	Tue, 11 Apr 2023 12:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604F310E2ED
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 12:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FUmkmOKN19u9oTFTObPG6OdQPLkBNgFyv1/s7VKASZc=; b=N1tbFU/UMPEoKfl4d1BBu+vUoT
 phCAAFu4tRPyXVS84RHrgYroHLt3Zk2eQaojMm7wOSSFseoMImu2Rp5ppU2yimAFrfwAFHTq7i2Gd
 B+F9VSATqaN0k5b3iS9V990V/K/vEwTCIpbr8hxW7IUhK3gL6CQbwZoKul3KO1+vu0ndmkiYZ4r5X
 5MPiEZFYQC+IO2b2NIY9r+25MzVhsBXj6E63mtU5gW15VvmsDaGxKfplQzUR7TgWMNA3cg/kIJghe
 klhdPFLPz5o2TmSJliPe2r+9dQwo5wkKPcL2aOyvhWAZo+bRt7G8ER/9mH28SevkRkvGNgLIBNlD1
 t5jGLlVQ==;
Received: from [143.107.225.16] (helo=[172.20.31.219])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pmCxq-00Fi1i-1H; Tue, 11 Apr 2023 14:19:10 +0200
Message-ID: <93ce81f8-3f64-e7b9-f6f1-f0cdc3cf6c6c@igalia.com>
Date: Tue, 11 Apr 2023 09:18:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] drm/vkms: add module parameter to set background color
To: Simon Ser <contact@emersion.fr>, Melissa Wen <mwen@igalia.com>
References: <20230410125435.128689-1-mcanal@igalia.com>
 <gY5DtUoeqVhT1HdJU8yjHSqwe9gTIbV6Q2yVDYRyI_JGHS6Lo73Ivjs2G8d_5T_qL2q7pOhjC6O_aPk2Pnn3npdhzh2Y-_nrD98r3ONMrWc=@emersion.fr>
 <20230410175036.tqjbwrd4ldcnnqlf@mail.igalia.com>
 <86KSXjLyx61ozmy_5grAFQ5XGxnysnSnGRCD6FQsgzrUc2xnXQpv06rcPu9FWkXNo7PLu7dEMTmsX9uWVvEMSKYW62ELEjloEfHGCZUqob8=@emersion.fr>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <86KSXjLyx61ozmy_5grAFQ5XGxnysnSnGRCD6FQsgzrUc2xnXQpv06rcPu9FWkXNo7PLu7dEMTmsX9uWVvEMSKYW62ELEjloEfHGCZUqob8=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/11/23 05:58, Simon Ser wrote:
> Hi,
> 
> On Monday, April 10th, 2023 at 19:50, Melissa Wen <mwen@igalia.com> wrote:
> 
>> On 04/10, Simon Ser wrote:
>>
>>> I think this should be a KMS property instead of a module parameter.
>>> Is there a reason why this patch uses a module parameter? It breaks
>>> user-space expectations.
>>
>> a KMS property is what we have on vkms TODO [1] and the module parameter
>> was Maíra's first step to open a discussion for this property [2].
>> AFAIK, we would need to create the KMS property first, but it seems
>> there isn't an userspace case/need to support this API change.
>> Do you know any valid use cases to support a bkg color property?
> 
> There have been previous attempts for msm [1] and i915 [2].
> 
>  From user-space PoV, a KMS property would be useful, for instance to
> render single color background images. I can type some user-space code
> if that helps.

I believe that, if we have some user-space code, we can push this as a
KMS property. If you can provide some user-space code, I can work on
the KMS property to back the use case and we can move this forward.

> 
> If this is a module parameter instead of a KMS property, what purpose
> does this achieve? What is the use-case? Just trying to understand the
> motivation here.
> 

This was a attempt to start the discussion about the background color
property. Without the user-space use case, we cannot move this forward
and as I didn't have a user-space use case, I decided to implement it as
a module parameter.

Best Regards,
- Maíra Canal

> Thanks,
> 
> Simon
> 
> [1]: https://lore.kernel.org/dri-devel/20221028225952.160-1-quic_jesszhan@quicinc.com/
> [2]: https://lore.kernel.org/dri-devel/20190930224707.14904-1-matthew.d.roper@intel.com/
