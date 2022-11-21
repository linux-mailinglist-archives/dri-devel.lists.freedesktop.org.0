Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEACA632BCC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 19:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC4210E329;
	Mon, 21 Nov 2022 18:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B27010E329
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 18:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EGCjxibfGRGWcHEcF05lQ7fpC6xBYzkRntZKzSQejyo=; b=k6wd1BkNuQu5gDCU/YOmA55BKW
 8cEAGeYDEt/U+XNCmqGg3S+z431UMU3rb0Zr371Ffn5nLG/nWcNenBHGnY2ZK+wiWEi9nRzMrFEbM
 U47XlSiQMyVqpEsBvqoDXer2dRJkLu4aVd7d0GqY80WMa6qADTD2M+yedntl5s6LoyCNOyNfgd/lG
 7Fq/9IFym4BthrWsiIfdg7cNdSTnWpfOdson5OfGkOrtXMw67ZsdrFf+9lVIRvS1woT72SCoqFLNT
 Ra9oGVD4gHNgWEa4XHUBBEESKsJOuHREZqURdM15iIJ4u/O0sPmy7oq6iNMYDiyAfypUQaZ7HFkB9
 Qq5QQ/Cg==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=50424)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oxBIR-00062M-4R; Mon, 21 Nov 2022 19:13:31 +0100
Message-ID: <de12952f-8346-8995-236d-69dcb70f19f6@tronnes.org>
Date: Mon, 21 Nov 2022 19:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: git send-email friendly smtp provider anyone?
To: Maxime Ripard <maxime@cerno.tech>
References: <1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org>
 <20221121151922.jaal6ym7z2ejju4q@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221121151922.jaal6ym7z2ejju4q@houat>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 21.11.2022 16.19, skrev Maxime Ripard:
> On Mon, Nov 21, 2022 at 12:48:52PM +0100, Noralf Trønnes wrote:
>> A couple of years ago my email provider blocked me from using git
>> send-email with their smtp server. So I switched to the one my ISP
>> provides. Now my ISP have outsourced their email service so the first 3
>> emails gets through and the rest looks like it ends up in a tar pit or
>> something, 18 hours later and 5 of 7 emails have gotten through. I have
>> asked them about this, but I fear the answer will be this is not
>> supported since they now don't have the service in-house anymore. I'm
>> waiting for a reply.
>>
>> Today I tried sendinblue.com since they have a free plan, but they
>> insert <br> in the emails so that didn't work out. They also have some
>> kind of queue, after 1 hour 6 of 7 emails have gotten through.
>>
>> Does anyone have an smtp provider to recommend that works with git
>> send-email and that sends out all the emails at once?
> 
> I'm using fastmail and am very happy about it so far.
> 
> Otherwise, you might consider using:
> https://b4.docs.kernel.org/en/latest/contributor/send.html#authenticating-with-the-web-submission-endpoint
> 

That's an interesting option. I did briefly look at b4 a few months back
but it looked like it was under heavy development so I figured I'd wait
before trying it out. I think I'll give b4 a spin to see how it works, I
wonder how it handles patch changelogs.

Noralf.
