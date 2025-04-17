Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04727A91508
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 09:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE4F10EA49;
	Thu, 17 Apr 2025 07:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mail.ru header.i=@mail.ru header.b="FDvNeJ1I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="pZQ7aQPl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="or8sdVxl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1239 seconds by postgrey-1.36 at gabe;
 Thu, 17 Apr 2025 06:44:56 UTC
Received: from fallback24.i.mail.ru (fallback24.i.mail.ru [79.137.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FDC10EA09
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 06:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=GA6QUkV8pQjqnWJEQYHYjAJLNHuHSyA6dUWKyaZOsWA=; 
 t=1744872296;x=1744962296; 
 b=FDvNeJ1IWI/hBroJyNK10IPIm2zM6KCnQPrV0FdYZ/KpYd+F89ZRPJfoAXKf/ahzjYvNwKsGD/jRQgujMQSDZ4jYlZV8Af5EHEs1RuLVqe9q9DTdnTBshM1UmyV0zKYA/lBP588NbVQslj253DsTA1a/Td99ejjFEDtGQsL2MnbB0SgB1lh2kKDLfxoxfT4mrHpEu3pnfIiCSt4g6QkOdJsd9LAzGSEUqlrD9mlS8Me/bRzV6Mg3ci9c8/F7FNFMDuSDyv311X5HN3wNueo4R8qAl4lMmUR2D4hN1eB8fx0LPeIXMtY9nV5nrfRO4oKKZmhk1MKdxnKWUaGFk6TQYw==;
Received: from [10.113.229.124] (port=44310 helo=send193.i.mail.ru)
 by fallback24.i.mail.ru with esmtp (envelope-from <sergey10050013@mail.ru>)
 id 1u5IfW-00D9Eq-2W; Thu, 17 Apr 2025 09:24:14 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=GA6QUkV8pQjqnWJEQYHYjAJLNHuHSyA6dUWKyaZOsWA=; t=1744871054; x=1744961054; 
 b=pZQ7aQPliQCh7fA9oj+UR5KMgQH9T8iZXg/9hGPyunyJ9K8/rEAHd0pagwUfGHc+ySPtWty3iO4
 npSumyyeb2nGqe1EK+rfUPMYAwz+55Fa9EVkID41lotg9J2vucaxxh16PeOpL2ENaWHibwbp2Txsx
 +1WY7c8E9gX9T6Agq7jeWrjuwZWK5aY8/ZoYsxUneDlgocp+SBO6JafXjBySNn8ajWwHr9z1kFn6V
 BwcUNowAqwonoZ9Yt8Ufe8lF+WGdz4/mwQUhnFK/nt0Jn9IBwKkJsKuT1+TXotkMPMOIqHD/khHV0
 MYldMi1XIfJMV0xSlrAk/FkFcC1oIE3bzaaQ==;
Received: from [10.113.89.59] (port=44388 helo=send197.i.mail.ru)
 by exim-fallback-77cfcb5658-6pv8r with esmtp (envelope-from
 <sergey10050013@mail.ru>)
 id 1u5Id9-00000000NwO-0e19; Thu, 17 Apr 2025 09:21:47 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:
 References:Cc:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=GA6QUkV8pQjqnWJEQYHYjAJLNHuHSyA6dUWKyaZOsWA=; t=1744870907; x=1744960907; 
 b=or8sdVxlffk3I9gweSmPdNcnUcfnwRnYd85NZze9RrQrQ4SWgwGP1/m6NSZ6RRTtvjNRVyJWoqE
 doCe+qvdN6BUn5jDrm66TrYtbkHn6rcK9+s15PEAXlIIeHuGyln3jcAo5js7VEuNbrFUguZNjrMrE
 BFTWcuAka24Ibw+ila4QwAF1i3XjthAsApfQE5DALytpKEk9i7NEm4cGBIGdrMaaMCnn+llmcPi9t
 vUPauzmLw0ebK1N+wecyDp+eNRpbRXrLp2q5aPaKDohCkV7BNfOucyrTFyadL7qe3Q64kz0YJBWYv
 AuHKbvAexyvNjmREP8KR7BKpZEU0wp/LVvxw==;
Received: by exim-smtp-5c5f4778f6-76zfr with esmtpa (envelope-from
 <sergey10050013@mail.ru>)
 id 1u5Iag-00000000FIr-0Dz0; Thu, 17 Apr 2025 09:19:14 +0300
Message-ID: <6bc9f0d6-e4e5-45f0-b493-67fea3df0129@mail.ru>
Date: Thu, 17 Apr 2025 09:19:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: tzimmermann@suse.de
Cc: afmerlord@gmail.com, airlied@redhat.com, dri-devel@lists.freedesktop.org, 
 jfalempe@redhat.com, stable@vger.kernel.org, wakko@animx.eu.org
References: <568a359c-e096-4486-84b3-95b37b2de7a6@suse.de>
Subject: Re: [PATCH] drm/mgag200: Fix value in <VBLKSTR> register
Content-Language: ru
From: =?UTF-8?B?0KHQtdGA0LPQtdC5?= <sergey10050013@mail.ru>
In-Reply-To: <568a359c-e096-4486-84b3-95b37b2de7a6@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9563C565BC82192378847690FF3AF5CEEE1CB00C4E36F71B6182A05F5380850404C228DA9ACA6FE27773E67147394E06F3DE06ABAFEAF670581C49C5BB4825DBA3702503918D4D0D766470F935E541B6A
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F9D3BE5B596754B8C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7353CFE866E745C13EA1F7E6F0F101C67CDEEF6D7F21E0D1D9295C2E9FA3191EE1B59CA4C82EFA658057326F2BF9C0A444F73D3233A2A14BEE234CB681BD25C546F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7985FEE833124D2D39FA2833FD35BB23D9E625A9149C048EEB1593CA6EC85F86DBDFBBEFFF4125B51D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BA9BB761A57C26B8FA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCEE6865575290A7923AA81AA40904B5D9CF19DD082D7633A0C84D3B47A649675F3AA81AA40904B5D98AA50765F7900637C19E3E633E4C12D3D81D268191BDAD3D3666184CF4C3C14F3FC91FA280E0CE3D1A620F70A64A45A98AA50765F7900637F9425D8FA97DB4396D1867E19FE1407978DA827A17800CE773BC869C69ECC1572DBA43225CD8A89F83C798A30B85E16B42539A7722CA490CB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A5A768D91096979CCE5002B1117B3ED696FAAED67682C94E0A4869453249F34FA4823CB91A9FED034534781492E4B8EEADEF0AF71940E62277BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF49EDE303FFABE85A1181DD3607841F6C43D551A8C70F1FF68B791F177C6E4FBCF964158C91B2A10BAE3C13A4B731FE0309D8748A5D392E24C45097F8BDF3BBBEA652FF1B6044C1F936DDF96CB8D31E6A913E6812662D5F2AB9AF64DB46887680F242460C1FBAC71F06B106A8FD94427783DB18EBE73F7D69
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS2bpaGes9W5CyoOaCnQGf4=
X-Mailru-Sender: 59164B86F61DAAFB5FEAE383BCC169E9F2FC61513FB98B69EDE2FBCE1621770ADE051DEDD57442D83783390660581B8BAE2B45553EEBD8AF3DCCF50608321A3F8AC48D16AC61704F0FEF9BDE609775C275CFB4384D6808B37872E23597E4BFD4B4A721A3011E896F
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B4FA065CEEE8D5A63103B021D89128220A549C864CA5B72DA768F3CF0E9FE49B69475EBDC38F67034248AE0FDD6B318C2E0593C4BC31931DAEDC22DA78E3D463F405CA5597B0CD5826
X-7FA49CB5: 0D63561A33F958A5B1A5AFF90A1D12825002B1117B3ED696C96ABC80C3CCD8904F9F34E272408E5002ED4CEA229C1FA827C277FBC8AE2E8B5CB86E264D954E90
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZsde8Evks0Rm7OIJ5hBlQXw==
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4FA065CEEE8D5A631099FAECD87C0F44021EFC98957CE528668F3CF0E9FE49B69475EBDC38F6703423457109D3C5F5DD9E436A30B6A75F6CADBEAA59E6CB68664
X-7FA49CB5: 0D63561A33F958A52FC803F1721F04F80714A4477B3EE355571C4104B6B85678CACD7DF95DA8FC8BD5E8D9A59859A8B67C6342DCCD0FE4D8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ7yaoqmBvMpaQK/Dq7T2q9g==
X-Mras: Ok
X-Mailman-Approved-At: Thu, 17 Apr 2025 07:22:17 +0000
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

Hello. Maybe I don't understand something, but I installed kernel 
version 6.14.2 on Arch Linux and the problem with the blinking video 
signal on IPMI remained

