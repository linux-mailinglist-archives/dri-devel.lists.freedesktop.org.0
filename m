Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5172A3E7C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427426EC20;
	Tue,  3 Nov 2020 08:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15896E027
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 06:05:25 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa0f3280003>; Mon, 02 Nov 2020 22:05:28 -0800
Received: from [10.25.99.190] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 06:05:21 +0000
Subject: Re: [PATCH v3 0/3] dt-bindings: Convert graph bindings to json-schema
To: Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20201102203656.220187-1-robh@kernel.org>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <9a428e64-27ad-39d7-9e05-abcc7ce49429@nvidia.com>
Date: Tue, 3 Nov 2020 11:35:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102203656.220187-1-robh@kernel.org>
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604383528; bh=bFMxqKpNm1Rmm5wYbOGBWAFW0dBsLb7bbGwGavTI0bU=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=SBpEpcNvterN8bS5CVKenBtobx9I2HdW4S09mqp1tYLIJwJNCMTftl2khhecYfN5R
 Rmyo5W8xNhaJWU/RbLslnZjFpnnDqm0TpgevhXd3vT7UixKqC8RhNdkYzyWBC5z1Qd
 I2wmd4JqJbcodmZPEDb7HDXDaDo0X9YhJ0cXRFNJpns61omZKNx/6+k5fM13NyOSwY
 UY4R5U4FI3Zm1WyfN+OkClbADvMKAvwWSlj4Xk4YYfl7kl6r2+R96w27Fj3/0r5pX+
 9vTlVgQosQJBlpdw7f1lOcktvzMXpITvponbIDWx0berK6RlVrtK+V09TPTTnmEW3Q
 gVONAJu5qmiTQ==
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

> Sameer, I wanted to experiment with what the interface for graph users
> looks like, so I've tweaked your patch a bit and converted 2 users.

Thanks for the update and help.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
