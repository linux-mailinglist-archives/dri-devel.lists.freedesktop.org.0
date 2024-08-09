Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB16B94CB55
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 09:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F3710E865;
	Fri,  9 Aug 2024 07:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FzUf6ozN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA2410E865
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 07:29:40 +0000 (UTC)
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi
 [91.156.87.48])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16441581;
 Fri,  9 Aug 2024 09:28:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1723188525;
 bh=pJExY8JuoT2UlHfNzoCGEXQt2m/C5XWNhIXgTbXX84E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FzUf6ozNJ6rkt7GYGRjfom5in496Fc29tRe3ohxxhstp3/71xDwRJfATxou5nFmAr
 0Y+iwfYw5ndHgx/xgSm2tpEkXZBhpCySI2UtM5M291lpyNnwnkgUFoViujhsRtWew6
 mPp4BhNiU68KLHD5r6Av72NtT/X3e7/AoqgMuXJo=
Message-ID: <7b5db9c1-5cba-48c8-ae77-f224b7b4834f@ideasonboard.com>
Date: Fri, 9 Aug 2024 10:29:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] of: property: add of_graph_get_next_port()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
 <87le1aw8lw.wl-kuninori.morimoto.gx@renesas.com>
 <ca216286-b09a-4faf-8221-c88c21f4de0c@ideasonboard.com>
 <87a5hm8n0k.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <87a5hm8n0k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 09/08/2024 05:10, Kuninori Morimoto wrote:
> 
> Hi Tomi
> 
> Thank you for your review
> 
> 
>>> +/**
>>> + * of_graph_get_next_ports() - get next ports node.
>>> + * @parent: pointer to the parent device node
>>> + * @ports: current ports node, or NULL to get first
>>> + *
>>> + * Return: A 'ports' node pointer with refcount incremented. Refcount
>>> + * of the passed @prev node is decremented.
>>
>> No "prev" argument in the code.
>>
>> The of_graph_get_next_endpoint() function uses "previous" as the
>> argument name (well, the function declaration uses "previous", the
>> implementation uses "prev"...), and I would use the same naming here.
>>
>> Also of_graph_get_next_endpoint() talks about "previous endpoint node",
>> whereas here it's "current ports node". I'd use the same style here, so
>> "previous ports node".
>>
>> The same comments for the of_graph_get_next_port().
> 
> OK, thanks. Will fix in v2
> 
>>> +struct device_node *of_graph_get_next_ports(struct device_node *parent,
>>> +					    struct device_node *ports)
>>> +{
>>> +	if (!parent)
>>> +		return NULL;
>>> +
>>> +	if (!ports) {
>>> +		ports = of_get_child_by_name(parent, "ports");
>>> +
>>> +		/* use parent as its ports of this device if it not exist */
>>
>> I think this needs to be described in the kernel doc. I understand the
>> need for this, but it's somewhat counter-intuitive that this returns the
>> parent node if there are no ports nodes, so it must be highlighted in
>> the documentation.
>>
>> I wonder if a bit more complexity here would be good... I think here we
>> could:
>>
>> - If there are no 'ports' nodes in the parent, but there is a 'port'
>> node in the parent, return the parent node
>> - If there are no 'ports' nor 'port' nodes in the parent, return NULL
> 
> Thanks, but unfortunately, get_next_ports() checks only "ports" and
> doesn't check whether it has "port" node or not.

Yes, my point was if the check should be added. My reasoning is:

If we have this, of_graph_get_next_ports() returns the ports@0, and that 
makes sense:

parent {
	ports@0 {
		port@0 { };
	};
};

If we have this, of_graph_get_next_ports() returns the parent, and 
that's a bit surprising, but I can see the need, and it just needs to be 
documented:

parent {
	port { };
};

But if we have this, does it make sense that of_graph_get_next_ports() 
returns the parent, or should it return NULL:

parent {
	/* No ports or port */
};

> So correct comment here is maybe...
> 
> 	If "parent" doesn't have "ports", it returns "parent" itself as "ports"
> 
> I will add it on v2
> 
>>> +/**
>>> + * of_graph_get_next_port() - get next port node.
>>> + * @parent: pointer to the parent device node
>>> + * @port: current port node, or NULL to get first
>>> + *
>>> + * Return: A 'port' node pointer with refcount incremented. Refcount
>>> + * of the passed @prev node is decremented.
>>> + */
>>> +struct device_node *of_graph_get_next_port(struct device_node *parent,
>>> +					   struct device_node *port)
>>> +{
>>> +	if (!parent)
>>> +		return NULL;
>>> +
>>> +	if (!port) {
>>> +		struct device_node *ports __free(device_node) =
>>> +			of_graph_get_next_ports(parent, NULL);
>>> +
>>> +		return of_get_child_by_name(ports, "port");
>>> +	}
>>> +
>>> +	do {
>>> +		port = of_get_next_child(parent, port);
>>> +		if (!port)
>>> +			break;
>>> +	} while (!of_node_name_eq(port, "port"));
>>> +
>>> +	return port;
>>> +}
>>
>> Hmm... So if I call this with of_graph_get_next_port(dev_node, NULL)
>> (dev_node being the device node of the device), it'll give me the first
>> port in the first ports node, or the first port in the dev_node if there
>> are no ports nodes?
> 
> Yes
> 
>> And if I then continue iterating with of_graph_get_next_port(dev_node,
>> prev_port)... The call will return NULL if the dev_node contains "ports"
>> node (because the dev_node does not contain any "port" nodes)?
>>
>> So if I understand right, of_graph_get_next_port() must always be called
>> with a parent that contains port nodes. Sometimes that's the device's
>> node (if there's just one port) and sometimes that's ports node. If it's
>> called with a parent that contains ports node, it will not work correctly.
>>
>> If the above is right, then should this just return
>> "of_get_child_by_name(parent, "port")" if !port, instead of calling
>> of_graph_get_next_ports()?
> 
> Hmm ?  Do you mean you want access to ports@1 memeber port after ports@0 ?
> I have tested below in my test environment
> 
> 	parent {
> (X)		ports@0 {
> (A)			port@0 { };
> (B)			port@1 { };
> 		};
> (Y)		ports@1 {
> (C)			port@0 { };
> 		};
> 	};
> 
> In this case, if you call get_next_port() with parent,
> you can get ports@0 member port.
> 
> 	/* use "paramet" and use "ports@0" are same result */
> 
> 	// use parent
> 	port = of_graph_get_next_port(parent, NULL); // (A)
> 	port = of_graph_get_next_port(parent, port); // (B)
> 	port = of_graph_get_next_port(parent, port); // NULl
> 
> 	// use ports@0
> 	ports = of_graph_get_next_ports(parent, NULL); // (X)
> 	port  = of_graph_get_next_port(ports, NULL);   // (A)
> 	port  = of_graph_get_next_port(ports, port);   // (B)
> 	port  = of_graph_get_next_port(ports, port);   // NULl
> 
> If you want to get ports@1 member port, you need to use ports@1.
> 
> 	// use ports@1
> 	ports = of_graph_get_next_ports(parent, NULL);  // (X)
> 	ports = of_graph_get_next_ports(parent, ports); // (Y)
> 	port  = of_graph_get_next_port(ports, NULL);    // (C)
> 
> I have confirmed in my test environment.
> But please double check it. Is this clear for you ?

Ah, I see now. I was expecting of_get_next_child() to return children of 
'parent', but that's actually not the case.

So when you call:

	port = of_graph_get_next_port(parent, NULL); // (A)

the function will call 'ports = of_graph_get_next_ports(parent, NULL)' 
(ports is (X)) and then return of_get_child_by_name(ports, "port") 
(which is (A)). This is fine.

	port = of_graph_get_next_port(parent, port); // (B)

Here the function will call 'port = of_get_next_child(parent, port)', 
where parent is the parent node, and port is (A). The problem is, (A) is 
not a child of the parent. This seems to work, as of_get_next_child() 
does not use the 'parent' for anything if 'port' is given, instead if 
just gives the next sibling of 'port'.

	port = of_graph_get_next_port(parent, port); // NULl

And now when the function calls of_get_next_child(parent, port), it does 
not give the next child of parent, but instead NULL because 'port' has 
no more siblings.

The documentation for of_get_next_child() doesn't mention if calling 
of_get_next_child(parent, child) is valid when the given child is 
actually not a child of the parent. The doc says that 'prev' parameter 
should be "previous child of the parent node", which is not the case 
here. So using it like this does not sound right to me.

And just looking at the behavior of:

 > 	port = of_graph_get_next_port(parent, NULL); // (A)
 > 	port = of_graph_get_next_port(parent, port); // (B)
 > 	port = of_graph_get_next_port(parent, port); // NULl

it does not feel right. Why does of_graph_get_next_port() return only 
the ports of ports@0? I think it should either return nothing, as there 
are no 'port' nodes in the parent, or it should return all the port 
nodes from all the ports nodes.

Can we just drop the use of of_graph_get_next_ports() from 
of_graph_get_next_port()? In other words, make of_graph_get_next_port() 
iterate the 'port' nodes strictly only in the given parent node.

I think we have the same problem in of_graph_get_next_ports(). If we have:

parent {
	port { };
};

And we do:

ports = of_graph_get_next_ports(parent, NULL)

The returned 'ports' is actually the 'parent'. If we then call:

ports = of_graph_get_next_ports(parent, ports)

we are effectively calling of_graph_get_next_ports(parent, parent). This 
results in of_get_next_child(parent, parent). of_get_next_child() will 
return the next sibling of parent (so, perhaps, a node for some 
unrelated device). It then checks if the name of that node is 'ports'. 
So, while unlikely, if we have:

bus {
	/* our display device */
	display {
		port { };
	};

	/* some odd ports device */
	ports {
	};
};

and you use of_graph_get_next_ports() for display, you'll end up getting 
the 'ports' node.

I have to say, I feel that making the 'ports' node optional in the graph 
DT bindings was a mistake, but nothing we can do about that...

Can you try adding "WARN_ON(node && prev && node != prev->parent)" to 
of_get_next_child()?

>> Or maybe I'm just getting confused here. But in any case, I think it
>> would be very good to describe the behavior on the kernel doc for the
>> different ports/port structure cases (also for
>> of_graph_get_next_ports()), and be clear on what the parameters can be,
>> i.e. what kind of device nodes can be given as parent, and how the
>> function iterates over the ports.
> 
> OK, will do in v2
> 
>>> + * @np: pointer to the parent device node
>>> + *
>>> + * Return: count of port of this device node
>>> + */
>>> +unsigned int of_graph_get_port_count(struct device_node *np)
>>> +{
>>> +	struct device_node *port = NULL;
>>> +	int num = 0;
>>> +
>>> +	for_each_of_graph_port(np, port)
>>> +		num++;
>>> +
>>> +	return num;
>>> +}
>>
>> I my analysis above is right, calling of_graph_get_port_count(dev_node)
>> will return 1, if the dev_node contains "ports" node which contains one
>> or more "port" nodes.
> 
> In my test, it will be..
> 
> 	parent {
> 		ports@0 {
> 			port@0 { };
> 			port@1 { };
> 		};
> 		ports@1 {
> 			port@0 { };
> 		};
> 	};
> 
> 	of_graph_get_port_count(parent); // 2 = number of ports@0

I think the above is a bit surprising, and in my opinion points that 
there is a problem. Why does using 'parent' equate to only using 
'ports@0'? Again, I would expect either to get 0 (as there are no 'port' 
nodes in parent, or 3.

> 	of_graph_get_port_count(ports0); // 2 = number of ports@0
> 	of_graph_get_port_count(ports1); // 1 = number of ports@1
> 
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto

  Tomi

